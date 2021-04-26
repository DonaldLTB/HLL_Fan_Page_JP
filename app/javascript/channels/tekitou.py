import socket
from struct import pack, unpack


class SteamSocket(object):

    def chk_react_prot(self, recv_data):
        if recv_data[:6].hex() != 'ffffffff660a':
            raise ValueError
        print('OK')

    def connect_master_server(self):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        try:
            sock.connect(('hl2master.steampowered.com', 27011))
        except Exception:
            raise
        return sock

    def connect_intractive_server(self, ip_addr):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        try:
            sock.connect(ip_addr)
        except Exception:
            raise
        return sock


    def get_master_server_query(self, q_filter):
        '''
        return 
        ------
            list of tuple
            [('0.0.0.0', 0), ...]
        '''

        sock = self.connect_master_server()

        message_type = b'1'
        region_code = b'\xff'
        first_ip = b'0.0.0.0:0'
        filter_query = b'\x00' + q_filter.encode('utf-8') + b'\x00'
        send_m = message_type + region_code + first_ip + filter_query
        sock.send(send_m)
        self.recv_data =  sock.recv(8192)
        sock.close
        self.recv_prot = self.recv_data[:6]
        self.recv_body = self.recv_data[6:]
        if self.recv_prot.hex() != 'ffffffff660a':
            raise ValueError

        self.ipp_list = list()
        while True:
            proc_ips = self.recv_body[:6]
            tuple_ip = unpack('>BBBBH', proc_ips)
            sock_ip = '.'.join(list(map(str, tuple_ip[:4])))
            sock_port = tuple_ip[4]
            if sock_ip != '0.0.0.0' and sock_port != 0:
                self.ipp_list.append((sock_ip, sock_port))
            self.recv_body = self.recv_body[6:]
            if len(self.recv_body) < 1:
                break
        
        return self.ipp_list


    def get_game_server_info(self, ip_addr):
        '''
        return 
        ------
            dict
            {'servername': b'', 'running_map': b''}
        '''

        sock = self.connect_intractive_server(ip_addr)
        send_m = pack('<lc', -1, b'T') + b'Source Engine Query\x00'
        sock.send(send_m)
        self.server_info_recv = sock.recv(8192)
        sock.close
        server_info_dict = dict()
        recv_b = self.server_info_recv
        recv_b = recv_b[6:]
        server_info_dict['servername'] = recv_b.split(b'\x00')[0]
        server_info_dict['running_map'] = recv_b.split(b'\x00')[1]

        return server_info_dict


    def get_game_server_players(self, ip_addr):

        '''
        return 
        ------
            list of bytes
            [b'', ...]
        '''

        sock = self.connect_intractive_server(ip_addr)
        send_m = pack('<lci', -1, b'U', -1)
        sock.send(send_m)
        challenge_recv = sock.recv(8192)
        sock.send(pack('<lc', -1, b'U') + challenge_recv[5:])
        self.server_player_recv = sock.recv(8192)
        recv_b = self.server_player_recv
        recv_b = recv_b[7:]

        return recv_b.split(b'\x00')[::6]

    def search_player(self, q_filter, player_name):
        '''
        return 
        ------
            dict
            {'servername': b'', 'running_map': b''}
        '''

        ipps = self.get_master_server_query(q_filter)
        for ipp in ipps:
            player_list = self.get_game_server_players(ipp)
            if player_name.encode() in player_list:
                return self.get_game_server_info(ipp)
        return None
        



def main():
    ss = SteamSocket()
    print(ss.search_player('\\appid\\686810\\empty\\1', 'Takashi'))


if __name__ == '__main__':
    main()