# This is a shell archive.  Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".  Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
#	plat-freebsd5
#	plat-freebsd5/regen
#	plat-freebsd5/FCNTL.py
#	plat-freebsd5/SOCKET.py
#	plat-freebsd5/IN.py
#	plat-freebsd5/TERMIOS.py
#
echo c - plat-freebsd5
mkdir -p plat-freebsd5 > /dev/null 2>&1
echo x - plat-freebsd5/regen
sed 's/^X//' >plat-freebsd5/regen << 'END-of-plat-freebsd5/regen'
X#! /bin/sh
Xset -v
Xpython ../../Tools/scripts/h2py.py /usr/include/fcntl.h
Xpython ../../Tools/scripts/h2py.py /usr/include/sys/socket.h
Xpython ../../Tools/scripts/h2py.py -i '(u_long)' /usr/include/netinet/in.h
Xpython ../../Tools/scripts/h2py.py /usr/include/termios.h
END-of-plat-freebsd5/regen
echo x - plat-freebsd5/FCNTL.py
sed 's/^X//' >plat-freebsd5/FCNTL.py << 'END-of-plat-freebsd5/FCNTL.py'
X# Generated by h2py from /usr/include/fcntl.h
X
X# Included from sys/types.h
X
X# Included from sys/cdefs.h
Xdef __P(protos): return protos		 
X
Xdef __STRING(x): return #x		 
X
Xdef __XSTRING(x): return __STRING(x)	 
X
Xdef __P(protos): return ()		 
X
Xdef __STRING(x): return "x"
X
Xdef __RCSID(s): return __IDSTRING(rcsid,s)
X
Xdef __RCSID_SOURCE(s): return __IDSTRING(rcsid_source,s)
X
Xdef __COPYRIGHT(s): return __IDSTRING(copyright,s)
X
X
X# Included from sys/inttypes.h
X
X# Included from machine/ansi.h
X_BSD_CLOCKID_T_ = int
X_BSD_PTRDIFF_T_ = int
X_BSD_SSIZE_T_ = int
X_BSD_TIME_T_ = long
X_BSD_TIMER_T_ = int
X_BSD_CT_RUNE_T_ = int
X_BSD_PID_T_ = int
X_BSD_CLK_TCK_ = 128
X_BSD_CLOCKS_PER_SEC_ = 128
X
X# Included from machine/types.h
Xdef major(x): return ((int)(((u_int)(x) >> 8)&0xff))  
X
Xdef minor(x): return ((int)((x)&0xffff00ff))          
X
X
X# Included from machine/endian.h
X_QUAD_HIGHWORD = 1
X_QUAD_LOWWORD = 0
XLITTLE_ENDIAN = 1234
XBIG_ENDIAN = 4321
XPDP_ENDIAN = 3412
XBYTE_ORDER = LITTLE_ENDIAN
Xdef __word_swap_long(x): return \
X
Xdef __byte_swap_long(x): return \
X
Xdef __byte_swap_long(x): return \
X
Xdef __byte_swap_word(x): return \
X
Xntohl = __byte_swap_long
Xntohs = __byte_swap_word
Xhtonl = __byte_swap_long
Xhtons = __byte_swap_word
XNBBY = 8
XFD_SETSIZE = 1024
XO_RDONLY = 0x0000
XO_WRONLY = 0x0001
XO_RDWR = 0x0002
XO_ACCMODE = 0x0003
XFREAD = 0x0001
XFWRITE = 0x0002
XO_NONBLOCK = 0x0004
XO_APPEND = 0x0008
XO_SHLOCK = 0x0010
XO_EXLOCK = 0x0020
XO_ASYNC = 0x0040
XO_FSYNC = 0x0080
XO_NOFOLLOW = 0x0100
XO_CREAT = 0x0200
XO_TRUNC = 0x0400
XO_EXCL = 0x0800
XFMARK = 0x1000
XFDEFER = 0x2000
XFHASLOCK = 0x4000
XO_NOCTTY = 0x8000
Xdef FFLAGS(oflags): return ((oflags) + 1)
X
Xdef OFLAGS(fflags): return ((fflags) - 1)
X
XFAPPEND = O_APPEND
XFASYNC = O_ASYNC
XFFSYNC = O_FSYNC
XFNONBLOCK = O_NONBLOCK
XFNDELAY = O_NONBLOCK
XO_NDELAY = O_NONBLOCK
XF_DUPFD = 0
XF_GETFD = 1
XF_SETFD = 2
XF_GETFL = 3
XF_SETFL = 4
XF_GETOWN = 5
XF_SETOWN = 6
XF_GETLK = 7
XF_SETLK = 8
XF_SETLKW = 9
XFD_CLOEXEC = 1
XF_RDLCK = 1
XF_UNLCK = 2
XF_WRLCK = 3
XF_WAIT = 0x010
XF_FLOCK = 0x020
XF_POSIX = 0x040
XLOCK_SH = 0x01
XLOCK_EX = 0x02
XLOCK_NB = 0x04
XLOCK_UN = 0x08
END-of-plat-freebsd5/FCNTL.py
echo x - plat-freebsd5/SOCKET.py
sed 's/^X//' >plat-freebsd5/SOCKET.py << 'END-of-plat-freebsd5/SOCKET.py'
X# Generated by h2py from /usr/include/sys/socket.h
XSOCK_STREAM = 1
XSOCK_DGRAM = 2
XSOCK_RAW = 3
XSOCK_RDM = 4
XSOCK_SEQPACKET = 5
XSO_DEBUG = 0x0001
XSO_ACCEPTCONN = 0x0002
XSO_REUSEADDR = 0x0004
XSO_KEEPALIVE = 0x0008
XSO_DONTROUTE = 0x0010
XSO_BROADCAST = 0x0020
XSO_USELOOPBACK = 0x0040
XSO_LINGER = 0x0080
XSO_OOBINLINE = 0x0100
XSO_REUSEPORT = 0x0200
XSO_TIMESTAMP = 0x0400
XSO_SNDBUF = 0x1001
XSO_RCVBUF = 0x1002
XSO_SNDLOWAT = 0x1003
XSO_RCVLOWAT = 0x1004
XSO_SNDTIMEO = 0x1005
XSO_RCVTIMEO = 0x1006
XSO_ERROR = 0x1007
XSO_TYPE = 0x1008
XSOL_SOCKET = 0xffff
XAF_UNSPEC = 0
XAF_LOCAL = 1
XAF_UNIX = AF_LOCAL
XAF_INET = 2
XAF_IMPLINK = 3
XAF_PUP = 4
XAF_CHAOS = 5
XAF_NS = 6
XAF_ISO = 7
XAF_OSI = AF_ISO
XAF_ECMA = 8
XAF_DATAKIT = 9
XAF_CCITT = 10
XAF_SNA = 11
XAF_DECnet = 12
XAF_DLI = 13
XAF_LAT = 14
XAF_HYLINK = 15
XAF_APPLETALK = 16
XAF_ROUTE = 17
XAF_LINK = 18
Xpseudo_AF_XTP = 19
XAF_COIP = 20
XAF_CNT = 21
Xpseudo_AF_RTIP = 22
XAF_IPX = 23
XAF_SIP = 24
Xpseudo_AF_PIP = 25
XAF_ISDN = 26
XAF_E164 = AF_ISDN
Xpseudo_AF_KEY = 27
XAF_INET6 = 28
XAF_NATM = 29
XAF_ATM = 30
Xpseudo_AF_HDRCMPLT = 31
XAF_NETGRAPH = 32
XAF_MAX = 33
XSOCK_MAXADDRLEN = 255
X_SS_MAXSIZE = 128
XPF_UNSPEC = AF_UNSPEC
XPF_LOCAL = AF_LOCAL
XPF_UNIX = PF_LOCAL
XPF_INET = AF_INET
XPF_IMPLINK = AF_IMPLINK
XPF_PUP = AF_PUP
XPF_CHAOS = AF_CHAOS
XPF_NS = AF_NS
XPF_ISO = AF_ISO
XPF_OSI = AF_ISO
XPF_ECMA = AF_ECMA
XPF_DATAKIT = AF_DATAKIT
XPF_CCITT = AF_CCITT
XPF_SNA = AF_SNA
XPF_DECnet = AF_DECnet
XPF_DLI = AF_DLI
XPF_LAT = AF_LAT
XPF_HYLINK = AF_HYLINK
XPF_APPLETALK = AF_APPLETALK
XPF_ROUTE = AF_ROUTE
XPF_LINK = AF_LINK
XPF_XTP = pseudo_AF_XTP
XPF_COIP = AF_COIP
XPF_CNT = AF_CNT
XPF_SIP = AF_SIP
XPF_IPX = AF_IPX
XPF_RTIP = pseudo_AF_RTIP
XPF_PIP = pseudo_AF_PIP
XPF_ISDN = AF_ISDN
XPF_KEY = pseudo_AF_KEY
XPF_INET6 = AF_INET6
XPF_NATM = AF_NATM
XPF_ATM = AF_ATM
XPF_NETGRAPH = AF_NETGRAPH
XPF_MAX = AF_MAX
XNET_MAXID = AF_MAX
XNET_RT_DUMP = 1
XNET_RT_FLAGS = 2
XNET_RT_IFLIST = 3
XNET_RT_MAXID = 4
XSOMAXCONN = 128
XMSG_OOB = 0x1
XMSG_PEEK = 0x2
XMSG_DONTROUTE = 0x4
XMSG_EOR = 0x8
XMSG_TRUNC = 0x10
XMSG_CTRUNC = 0x20
XMSG_WAITALL = 0x40
XMSG_DONTWAIT = 0x80
XMSG_EOF = 0x100
XMSG_COMPAT = 0x8000
XCMGROUP_MAX = 16
XSCM_RIGHTS = 0x01
XSCM_TIMESTAMP = 0x02
XSCM_CREDS = 0x03
XSHUT_RD = 0
XSHUT_WR = 1
XSHUT_RDWR = 2
X
X# Included from sys/cdefs.h
Xdef __P(protos): return protos		 
X
Xdef __STRING(x): return #x		 
X
Xdef __XSTRING(x): return __STRING(x)	 
X
Xdef __P(protos): return ()		 
X
Xdef __STRING(x): return "x"
X
Xdef __RCSID(s): return __IDSTRING(rcsid,s)
X
Xdef __RCSID_SOURCE(s): return __IDSTRING(rcsid_source,s)
X
Xdef __COPYRIGHT(s): return __IDSTRING(copyright,s)
X
END-of-plat-freebsd5/SOCKET.py
echo x - plat-freebsd5/IN.py
sed 's/^X//' >plat-freebsd5/IN.py << 'END-of-plat-freebsd5/IN.py'
X# Generated by h2py from /usr/include/netinet/in.h
XIPPROTO_IP = 0
XIPPROTO_HOPOPTS = 0
XIPPROTO_ICMP = 1
XIPPROTO_IGMP = 2
XIPPROTO_GGP = 3
XIPPROTO_IPV4 = 4
XIPPROTO_IPIP = IPPROTO_IPV4
XIPPROTO_TCP = 6
XIPPROTO_ST = 7
XIPPROTO_EGP = 8
XIPPROTO_PIGP = 9
XIPPROTO_RCCMON = 10
XIPPROTO_NVPII = 11
XIPPROTO_PUP = 12
XIPPROTO_ARGUS = 13
XIPPROTO_EMCON = 14
XIPPROTO_XNET = 15
XIPPROTO_CHAOS = 16
XIPPROTO_UDP = 17
XIPPROTO_MUX = 18
XIPPROTO_MEAS = 19
XIPPROTO_HMP = 20
XIPPROTO_PRM = 21
XIPPROTO_IDP = 22
XIPPROTO_TRUNK1 = 23
XIPPROTO_TRUNK2 = 24
XIPPROTO_LEAF1 = 25
XIPPROTO_LEAF2 = 26
XIPPROTO_RDP = 27
XIPPROTO_IRTP = 28
XIPPROTO_TP = 29
XIPPROTO_BLT = 30
XIPPROTO_NSP = 31
XIPPROTO_INP = 32
XIPPROTO_SEP = 33
XIPPROTO_3PC = 34
XIPPROTO_IDPR = 35
XIPPROTO_XTP = 36
XIPPROTO_DDP = 37
XIPPROTO_CMTP = 38
XIPPROTO_TPXX = 39
XIPPROTO_IL = 40
XIPPROTO_IPV6 = 41
XIPPROTO_SDRP = 42
XIPPROTO_ROUTING = 43
XIPPROTO_FRAGMENT = 44
XIPPROTO_IDRP = 45
XIPPROTO_RSVP = 46
XIPPROTO_GRE = 47
XIPPROTO_MHRP = 48
XIPPROTO_BHA = 49
XIPPROTO_ESP = 50
XIPPROTO_AH = 51
XIPPROTO_INLSP = 52
XIPPROTO_SWIPE = 53
XIPPROTO_NHRP = 54
XIPPROTO_ICMPV6 = 58
XIPPROTO_NONE = 59
XIPPROTO_DSTOPTS = 60
XIPPROTO_AHIP = 61
XIPPROTO_CFTP = 62
XIPPROTO_HELLO = 63
XIPPROTO_SATEXPAK = 64
XIPPROTO_KRYPTOLAN = 65
XIPPROTO_RVD = 66
XIPPROTO_IPPC = 67
XIPPROTO_ADFS = 68
XIPPROTO_SATMON = 69
XIPPROTO_VISA = 70
XIPPROTO_IPCV = 71
XIPPROTO_CPNX = 72
XIPPROTO_CPHB = 73
XIPPROTO_WSN = 74
XIPPROTO_PVP = 75
XIPPROTO_BRSATMON = 76
XIPPROTO_ND = 77
XIPPROTO_WBMON = 78
XIPPROTO_WBEXPAK = 79
XIPPROTO_EON = 80
XIPPROTO_VMTP = 81
XIPPROTO_SVMTP = 82
XIPPROTO_VINES = 83
XIPPROTO_TTP = 84
XIPPROTO_IGP = 85
XIPPROTO_DGP = 86
XIPPROTO_TCF = 87
XIPPROTO_IGRP = 88
XIPPROTO_OSPFIGP = 89
XIPPROTO_SRPC = 90
XIPPROTO_LARP = 91
XIPPROTO_MTP = 92
XIPPROTO_AX25 = 93
XIPPROTO_IPEIP = 94
XIPPROTO_MICP = 95
XIPPROTO_SCCSP = 96
XIPPROTO_ETHERIP = 97
XIPPROTO_ENCAP = 98
XIPPROTO_APES = 99
XIPPROTO_GMTP = 100
XIPPROTO_IPCOMP = 108
XIPPROTO_PIM = 103
XIPPROTO_PGM = 113
XIPPROTO_DIVERT = 254
XIPPROTO_RAW = 255
XIPPROTO_MAX = 256
XIPPROTO_DONE = 257
XIPPORT_RESERVED = 1024
XIPPORT_USERRESERVED = 5000
XIPPORT_HIFIRSTAUTO = 49152
XIPPORT_HILASTAUTO = 65535
XIPPORT_RESERVEDSTART = 600
Xdef IN_CLASSA(i): return (((u_int32_t)(i) & 0x80000000) == 0)
X
XIN_CLASSA_NET = 0xff000000
XIN_CLASSA_NSHIFT = 24
XIN_CLASSA_HOST = 0x00ffffff
XIN_CLASSA_MAX = 128
Xdef IN_CLASSB(i): return (((u_int32_t)(i) & 0xc0000000) == 0x80000000)
X
XIN_CLASSB_NET = 0xffff0000
XIN_CLASSB_NSHIFT = 16
XIN_CLASSB_HOST = 0x0000ffff
XIN_CLASSB_MAX = 65536
Xdef IN_CLASSC(i): return (((u_int32_t)(i) & 0xe0000000) == 0xc0000000)
X
XIN_CLASSC_NET = 0xffffff00
XIN_CLASSC_NSHIFT = 8
XIN_CLASSC_HOST = 0x000000ff
Xdef IN_CLASSD(i): return (((u_int32_t)(i) & 0xf0000000) == 0xe0000000)
X
XIN_CLASSD_NET = 0xf0000000
XIN_CLASSD_NSHIFT = 28
XIN_CLASSD_HOST = 0x0fffffff
Xdef IN_MULTICAST(i): return IN_CLASSD(i)
X
Xdef IN_EXPERIMENTAL(i): return (((u_int32_t)(i) & 0xf0000000) == 0xf0000000)
X
Xdef IN_BADCLASS(i): return (((u_int32_t)(i) & 0xf0000000) == 0xf0000000)
X
XINADDR_NONE = 0xffffffff
XIN_LOOPBACKNET = 127
XINET_ADDRSTRLEN = 16
XIP_OPTIONS = 1
XIP_HDRINCL = 2
XIP_TOS = 3
XIP_TTL = 4
XIP_RECVOPTS = 5
XIP_RECVRETOPTS = 6
XIP_RECVDSTADDR = 7
XIP_RETOPTS = 8
XIP_MULTICAST_IF = 9
XIP_MULTICAST_TTL = 10
XIP_MULTICAST_LOOP = 11
XIP_ADD_MEMBERSHIP = 12
XIP_DROP_MEMBERSHIP = 13
XIP_MULTICAST_VIF = 14
XIP_RSVP_ON = 15
XIP_RSVP_OFF = 16
XIP_RSVP_VIF_ON = 17
XIP_RSVP_VIF_OFF = 18
XIP_PORTRANGE = 19
XIP_RECVIF = 20
XIP_IPSEC_POLICY = 21
XIP_FAITH = 22
XIP_FW_ADD = 50
XIP_FW_DEL = 51
XIP_FW_FLUSH = 52
XIP_FW_ZERO = 53
XIP_FW_GET = 54
XIP_FW_RESETLOG = 55
XIP_DUMMYNET_CONFIGURE = 60
XIP_DUMMYNET_DEL = 61
XIP_DUMMYNET_FLUSH = 62
XIP_DUMMYNET_GET = 64
XIP_DEFAULT_MULTICAST_TTL = 1
XIP_DEFAULT_MULTICAST_LOOP = 1
XIP_MAX_MEMBERSHIPS = 20
XIP_PORTRANGE_DEFAULT = 0
XIP_PORTRANGE_HIGH = 1
XIP_PORTRANGE_LOW = 2
XIPPROTO_MAXID = (IPPROTO_ESP + 1)
XIPCTL_FORWARDING = 1
XIPCTL_SENDREDIRECTS = 2
XIPCTL_DEFTTL = 3
XIPCTL_DEFMTU = 4
XIPCTL_RTEXPIRE = 5
XIPCTL_RTMINEXPIRE = 6
XIPCTL_RTMAXCACHE = 7
XIPCTL_SOURCEROUTE = 8
XIPCTL_DIRECTEDBROADCAST = 9
XIPCTL_INTRQMAXLEN = 10
XIPCTL_INTRQDROPS = 11
XIPCTL_STATS = 12
XIPCTL_ACCEPTSOURCEROUTE = 13
XIPCTL_FASTFORWARDING = 14
XIPCTL_KEEPFAITH = 15
XIPCTL_GIF_TTL = 16
XIPCTL_MAXID = 17
X
X# Included from netinet6/in6.h
X
X# Included from sys/queue.h
Xdef SLIST_HEAD_INITIALIZER(head): return \
X
Xdef SLIST_ENTRY(type): return \
X
Xdef STAILQ_HEAD_INITIALIZER(head): return \
X
Xdef STAILQ_ENTRY(type): return \
X
Xdef LIST_HEAD_INITIALIZER(head): return \
X
Xdef LIST_ENTRY(type): return \
X
Xdef TAILQ_HEAD_INITIALIZER(head): return \
X
Xdef TAILQ_ENTRY(type): return \
X
Xdef CIRCLEQ_ENTRY(type): return \
X
X__KAME_VERSION = "SNAP 19991101"
XIPV6PORT_RESERVED = 1024
XIPV6PORT_ANONMIN = 49152
XIPV6PORT_ANONMAX = 65535
XIPV6PORT_RESERVEDMIN = 600
XIPV6PORT_RESERVEDMAX = (IPV6PORT_RESERVED-1)
XINET6_ADDRSTRLEN = 46
XIPV6_ADDR_INT32_ONE = 1
XIPV6_ADDR_INT32_TWO = 2
XIPV6_ADDR_INT32_MNL = 0xff010000
XIPV6_ADDR_INT32_MLL = 0xff020000
XIPV6_ADDR_INT32_SMP = 0x0000ffff
XIPV6_ADDR_INT16_ULL = 0xfe80
XIPV6_ADDR_INT16_USL = 0xfec0
XIPV6_ADDR_INT16_MLL = 0xff02
XIPV6_ADDR_INT32_ONE = 0x01000000
XIPV6_ADDR_INT32_TWO = 0x02000000
XIPV6_ADDR_INT32_MNL = 0x000001ff
XIPV6_ADDR_INT32_MLL = 0x000002ff
XIPV6_ADDR_INT32_SMP = 0xffff0000
XIPV6_ADDR_INT16_ULL = 0x80fe
XIPV6_ADDR_INT16_USL = 0xc0fe
XIPV6_ADDR_INT16_MLL = 0x02ff
Xdef IN6_IS_ADDR_UNSPECIFIED(a): return \
X
Xdef IN6_IS_ADDR_LOOPBACK(a): return \
X
Xdef IN6_IS_ADDR_V4COMPAT(a): return \
X
Xdef IN6_IS_ADDR_V4MAPPED(a): return \
X
XIPV6_ADDR_SCOPE_NODELOCAL = 0x01
XIPV6_ADDR_SCOPE_LINKLOCAL = 0x02
XIPV6_ADDR_SCOPE_SITELOCAL = 0x05
XIPV6_ADDR_SCOPE_ORGLOCAL = 0x08
XIPV6_ADDR_SCOPE_GLOBAL = 0x0e
X__IPV6_ADDR_SCOPE_NODELOCAL = 0x01
X__IPV6_ADDR_SCOPE_LINKLOCAL = 0x02
X__IPV6_ADDR_SCOPE_SITELOCAL = 0x05
X__IPV6_ADDR_SCOPE_ORGLOCAL = 0x08
X__IPV6_ADDR_SCOPE_GLOBAL = 0x0e
Xdef IN6_IS_ADDR_LINKLOCAL(a): return \
X
Xdef IN6_IS_ADDR_SITELOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_NODELOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_LINKLOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_SITELOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_ORGLOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_GLOBAL(a): return \
X
Xdef IN6_IS_ADDR_MC_NODELOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_LINKLOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_SITELOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_ORGLOCAL(a): return \
X
Xdef IN6_IS_ADDR_MC_GLOBAL(a): return \
X
Xdef IN6_IS_SCOPE_LINKLOCAL(a): return \
X
XIPV6_OPTIONS = 1
XIPV6_SOCKOPT_RESERVED1 = 3
XIPV6_UNICAST_HOPS = 4
XIPV6_RECVOPTS = 5
XIPV6_RECVRETOPTS = 6
XIPV6_RECVDSTADDR = 7
XIPV6_RETOPTS = 8
XIPV6_MULTICAST_IF = 9
XIPV6_MULTICAST_HOPS = 10
XIPV6_MULTICAST_LOOP = 11
XIPV6_JOIN_GROUP = 12
XIPV6_LEAVE_GROUP = 13
XIPV6_PORTRANGE = 14
XICMP6_FILTER = 18
XIPV6_PKTINFO = 19
XIPV6_HOPLIMIT = 20
XIPV6_NEXTHOP = 21
XIPV6_HOPOPTS = 22
XIPV6_DSTOPTS = 23
XIPV6_RTHDR = 24
XIPV6_PKTOPTIONS = 25
XIPV6_CHECKSUM = 26
XIPV6_BINDV6ONLY = 27
XIPV6_IPSEC_POLICY = 28
XIPV6_FAITH = 29
XIPV6_FW_ADD = 30
XIPV6_FW_DEL = 31
XIPV6_FW_FLUSH = 32
XIPV6_FW_ZERO = 33
XIPV6_FW_GET = 34
XIPV6_RTHDR_LOOSE = 0
XIPV6_RTHDR_STRICT = 1
XIPV6_RTHDR_TYPE_0 = 0
XIPV6_DEFAULT_MULTICAST_HOPS = 1
XIPV6_DEFAULT_MULTICAST_LOOP = 1
XIPV6_PORTRANGE_DEFAULT = 0
XIPV6_PORTRANGE_HIGH = 1
XIPV6_PORTRANGE_LOW = 2
XIPV6PROTO_MAXID = (IPPROTO_PIM + 1)
XIPV6CTL_FORWARDING = 1
XIPV6CTL_SENDREDIRECTS = 2
XIPV6CTL_DEFHLIM = 3
XIPV6CTL_DEFMTU = 4
XIPV6CTL_FORWSRCRT = 5
XIPV6CTL_STATS = 6
XIPV6CTL_MRTSTATS = 7
XIPV6CTL_MRTPROTO = 8
XIPV6CTL_MAXFRAGPACKETS = 9
XIPV6CTL_SOURCECHECK = 10
XIPV6CTL_SOURCECHECK_LOGINT = 11
XIPV6CTL_ACCEPT_RTADV = 12
XIPV6CTL_KEEPFAITH = 13
XIPV6CTL_LOG_INTERVAL = 14
XIPV6CTL_HDRNESTLIMIT = 15
XIPV6CTL_DAD_COUNT = 16
XIPV6CTL_AUTO_FLOWLABEL = 17
XIPV6CTL_DEFMCASTHLIM = 18
XIPV6CTL_GIF_HLIM = 19
XIPV6CTL_KAME_VERSION = 20
XIPV6CTL_USE_DEPRECATED = 21
XIPV6CTL_RR_PRUNE = 22
XIPV6CTL_MAPPED_ADDR = 23
XIPV6CTL_MAXID = 24
END-of-plat-freebsd5/IN.py
echo x - plat-freebsd5/TERMIOS.py
sed 's/^X//' >plat-freebsd5/TERMIOS.py << 'END-of-plat-freebsd5/TERMIOS.py'
X# Generated by h2py from /usr/include/termios.h
XVEOF = 0
XVEOL = 1
XVEOL2 = 2
XVERASE = 3
XVWERASE = 4
XVKILL = 5
XVREPRINT = 6
XVINTR = 8
XVQUIT = 9
XVSUSP = 10
XVDSUSP = 11
XVSTART = 12
XVSTOP = 13
XVLNEXT = 14
XVDISCARD = 15
XVMIN = 16
XVTIME = 17
XVSTATUS = 18
XNCCS = 20
X_POSIX_VDISABLE = 0xff
XIGNBRK = 0x00000001
XBRKINT = 0x00000002
XIGNPAR = 0x00000004
XPARMRK = 0x00000008
XINPCK = 0x00000010
XISTRIP = 0x00000020
XINLCR = 0x00000040
XIGNCR = 0x00000080
XICRNL = 0x00000100
XIXON = 0x00000200
XIXOFF = 0x00000400
XIXANY = 0x00000800
XIMAXBEL = 0x00002000
XOPOST = 0x00000001
XONLCR = 0x00000002
XOXTABS = 0x00000004
XONOEOT = 0x00000008
XCIGNORE = 0x00000001
XCSIZE = 0x00000300
XCS5 = 0x00000000
XCS6 = 0x00000100
XCS7 = 0x00000200
XCS8 = 0x00000300
XCSTOPB = 0x00000400
XCREAD = 0x00000800
XPARENB = 0x00001000
XPARODD = 0x00002000
XHUPCL = 0x00004000
XCLOCAL = 0x00008000
XCCTS_OFLOW = 0x00010000
XCRTS_IFLOW = 0x00020000
XCDTR_IFLOW = 0x00040000
XCDSR_OFLOW = 0x00080000
XCCAR_OFLOW = 0x00100000
XMDMBUF = 0x00100000
XECHOKE = 0x00000001
XECHOE = 0x00000002
XECHOK = 0x00000004
XECHO = 0x00000008
XECHONL = 0x00000010
XECHOPRT = 0x00000020
XECHOCTL = 0x00000040
XISIG = 0x00000080
XICANON = 0x00000100
XALTWERASE = 0x00000200
XIEXTEN = 0x00000400
XEXTPROC = 0x00000800
XTOSTOP = 0x00400000
XFLUSHO = 0x00800000
XNOKERNINFO = 0x02000000
XPENDIN = 0x20000000
XNOFLSH = 0x80000000
XTCSANOW = 0
XTCSADRAIN = 1
XTCSAFLUSH = 2
XTCSASOFT = 0x10
XB0 = 0
XB50 = 50
XB75 = 75
XB110 = 110
XB134 = 134
XB150 = 150
XB200 = 200
XB300 = 300
XB600 = 600
XB1200 = 1200
XB1800 = 1800
XB2400 = 2400
XB4800 = 4800
XB9600 = 9600
XB19200 = 19200
XB38400 = 38400
XB7200 = 7200
XB14400 = 14400
XB28800 = 28800
XB57600 = 57600
XB76800 = 76800
XB115200 = 115200
XB230400 = 230400
XEXTA = 19200
XEXTB = 38400
XTCIFLUSH = 1
XTCOFLUSH = 2
XTCIOFLUSH = 3
XTCOOFF = 1
XTCOON = 2
XTCIOFF = 3
XTCION = 4
X
X# Included from sys/cdefs.h
Xdef __P(protos): return protos		 
X
Xdef __STRING(x): return #x		 
X
Xdef __XSTRING(x): return __STRING(x)	 
X
Xdef __P(protos): return ()		 
X
Xdef __STRING(x): return "x"
X
Xdef __RCSID(s): return __IDSTRING(rcsid,s)
X
Xdef __RCSID_SOURCE(s): return __IDSTRING(rcsid_source,s)
X
Xdef __COPYRIGHT(s): return __IDSTRING(copyright,s)
X
X
X# Included from sys/ttycom.h
X
X# Included from sys/ioccom.h
XIOCPARM_MASK = 0x1fff
Xdef IOCPARM_LEN(x): return (((x) >> 16) & IOCPARM_MASK)
X
Xdef IOCBASECMD(x): return ((x) & ~(IOCPARM_MASK << 16))
X
Xdef IOCGROUP(x): return (((x) >> 8) & 0xff)
X
XIOC_VOID = 0x20000000
XIOC_OUT = 0x40000000
XIOC_IN = 0x80000000
XIOC_INOUT = (IOC_IN|IOC_OUT)
XIOC_DIRMASK = 0xe0000000
XTIOCM_LE = 0001
XTIOCM_DTR = 0002
XTIOCM_RTS = 0004
XTIOCM_ST = 0010
XTIOCM_SR = 0020
XTIOCM_CTS = 0040
XTIOCM_CAR = 0100
XTIOCM_CD = TIOCM_CAR
XTIOCM_RNG = 0200
XTIOCM_RI = TIOCM_RNG
XTIOCM_DSR = 0400
XTIOCPKT_DATA = 0x00
XTIOCPKT_FLUSHREAD = 0x01
XTIOCPKT_FLUSHWRITE = 0x02
XTIOCPKT_STOP = 0x04
XTIOCPKT_START = 0x08
XTIOCPKT_NOSTOP = 0x10
XTIOCPKT_DOSTOP = 0x20
XTIOCPKT_IOCTL = 0x40
Xdef UIOCCMD(n): return _IO(ord('u'), n)	 
X
XTTYDISC = 0
XSLIPDISC = 4
XPPPDISC = 5
XNETGRAPHDISC = 6
X
X# Included from sys/ttydefaults.h
XTTYDEF_IFLAG = (BRKINT	| ICRNL	| IMAXBEL | IXON | IXANY)
XTTYDEF_OFLAG = (OPOST | ONLCR)
XTTYDEF_LFLAG = (ECHO | ICANON | ISIG | IEXTEN | ECHOE|ECHOKE|ECHOCTL)
XTTYDEF_CFLAG = (CREAD | CS8 | HUPCL)
XTTYDEF_SPEED = (B9600)
Xdef CTRL(x): return (x&037)
X
XCEOF = CTRL(ord('d'))
XCEOL = 0xff
XCERASE = 0177
XCINTR = CTRL(ord('c'))
XCSTATUS = CTRL(ord('t'))
XCKILL = CTRL(ord('u'))
XCMIN = 1
XCQUIT = 034
XCSUSP = CTRL(ord('z'))
XCTIME = 0
XCDSUSP = CTRL(ord('y'))
XCSTART = CTRL(ord('q'))
XCSTOP = CTRL(ord('s'))
XCLNEXT = CTRL(ord('v'))
XCDISCARD = CTRL(ord('o'))
XCWERASE = CTRL(ord('w'))
XCREPRINT = CTRL(ord('r'))
XCEOT = CEOF
XCBRK = CEOL
XCRPRNT = CREPRINT
XCFLUSH = CDISCARD
END-of-plat-freebsd5/TERMIOS.py
exit

