Return-Path: <linux-input+bounces-16072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A62C5614F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 08:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E1E3AB034
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 07:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB51F329C5D;
	Thu, 13 Nov 2025 07:38:15 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036532939A
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763019492; cv=none; b=dAZRR8QxmmNnbggOSVFoXC3q1uRgy7SlD75FX7EICUjzeXf06uUXz0ac0nxGE7LW+TdiiWVcWWRDHelG6uURqr7XH5HuU8T6OHZjfzljoN/l5ykzMgvoN6q5gSqQx/+7wWC8vWczJt/08pQcD1rkjQVaB8NdyQcwAXV9J3VyLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763019492; c=relaxed/simple;
	bh=zoA98aDmRWqVC3EG4T2m5V3pjt1pVYng5k3J9B7TWbU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZyE8HOsvbXUUmPDnLm0gFuIfcWgX4bHpEIZZY+sQAG73390io80tZIetod6Hu6bgt6nzF5ppeRj5SxyD74oJBcib8dYtJEWTgyhB9Wh1Ag5ybE2X/UcTCuL0SBhh/R7q36CGQ27xVYb3xCx0pFrLiKnC1roreKWIGb+t2rOOCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43470d72247so7294825ab.3
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 23:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763019482; x=1763624282;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj/8/RzZLINhOgxnCiyClIwWCGKqDsr9jBYx2uVc/bc=;
        b=eJ28BCVl0cvQ/8R6f/jagS9AMy1u691fPKZygkbwhz0haUQDZeBVNjqTKPv3/25njp
         YLJ5lBTHa64h4sVDgevSfXAzU4ZiPo2uPyXGTQ/Z1O/gnEPyyVzXvZVTLpUGhc2N3aLB
         XJJXLqUOoGmV3n7WyK/+UUbcdrHmeFYHJSbj0vLH04hhMYVjnEE7LE1O0B+6kog6AdXZ
         D02LhYQsViQLDlMLR1z5PeNlUFIxXK6z2LtXYsfX1oEhCoZZkEj3u2CeNpsSY/Q/LcU4
         yuspwzxoQue2s1oWQYx/2LIp/4lngfj8/5CHtyMnzcCa/q4r8O+uZ5f3ABh+JMpj1191
         cq+w==
X-Forwarded-Encrypted: i=1; AJvYcCVqr3sx/5s9cxCusT0RJirBI+Kkvh9UDVOnmqIjIvozUn6u3A3fCmVY2i7kKDTt0Kvly6CmSvR7rYO64Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2txGQgK+k64ArsBQv3NlgqTgBkSrJE3TZ4smymA2gG/wjSJy8
	1rUk7wI+3Mnta2UtPr6N/2J6Hs4/UHDdK2A0qMWEh2McItyTAbEa+2FB2tJBK7hjLwvy4nGpOtB
	2+GrH5bEDmM6pELASSr45ORp940/EbgKJ18IOtuVFpU0AbS4+mD8oLYMTHVs=
X-Google-Smtp-Source: AGHT+IGD6GxRfuW43+7nceBkVsPZ1/rRF9xjJrc8d8tLQI82aVjvcX3Y8Z/1WNttDMU56t3doiV3VwKzDgraZtjaIWqdsOUnEvn4
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e8b:b0:433:4f43:2322 with SMTP id
 e9e14a558f8ab-43473d21205mr80166005ab.4.1763019482514; Wed, 12 Nov 2025
 23:38:02 -0800 (PST)
Date: Wed, 12 Nov 2025 23:38:02 -0800
In-Reply-To: <148861b7-4f6b-45d9-8d52-1b21f8bb2395@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69158ada.a70a0220.3124cb.001d.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] memory leak in dualshock4_get_calibration_data
From: syzbot <syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

SYZFAIL: failed to recv rpc

SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0


Warning: Permanently added '10.128.0.165' (ED25519) to the list of known ho=
sts.
2025/11/13 07:36:48 parsed 1 programs
[   46.199818][ T5813] cgroup: Unknown subsys name 'net'
[   46.379023][ T5813] cgroup: Unknown subsys name 'cpuset'
[   46.385474][ T5813] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   54.888279][ T5813] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   56.340369][ T5825] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   56.421936][ T5832] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   56.429766][ T5832] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   56.436985][ T5832] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   56.445171][ T5832] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   56.452741][ T5832] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   56.846094][   T48] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   56.854123][   T48] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   56.864851][   T48] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   56.872802][   T48] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   57.063354][ T5895] chnl_net:caif_netlink_parms(): no params data found
[   57.083062][ T5895] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   57.090193][ T5895] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   57.097410][ T5895] bridge_slave_0: entered allmulticast mode
[   57.104038][ T5895] bridge_slave_0: entered promiscuous mode
[   57.113031][ T5895] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   57.120155][ T5895] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   57.127349][ T5895] bridge_slave_1: entered allmulticast mode
[   57.133596][ T5895] bridge_slave_1: entered promiscuous mode
[   57.144454][ T5895] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   57.154187][ T5895] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   57.168185][ T5895] team0: Port device team_slave_0 added
[   57.174463][ T5895] team0: Port device team_slave_1 added
[   57.186086][ T5895] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   57.193078][ T5895] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   57.219301][ T5895] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   57.230889][ T5895] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   57.237915][ T5895] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   57.263881][ T5895] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   57.281848][ T5895] hsr_slave_0: entered promiscuous mode
[   57.287619][ T5895] hsr_slave_1: entered promiscuous mode
[   57.317718][ T5895] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   57.325494][ T5895] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   57.334404][ T5895] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   57.349057][ T5895] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   57.361932][ T5895] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   57.368995][ T5895] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   57.376311][ T5895] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   57.383366][ T5895] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   57.402889][ T5895] 8021q: adding VLAN 0 to HW filter on device bond0
[   57.412746][   T48] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   57.420421][   T48] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   57.430935][ T5895] 8021q: adding VLAN 0 to HW filter on device team0
[   57.439750][ T1005] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   57.446848][ T1005] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   57.455906][ T1005] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   57.463221][ T1005] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   57.480670][ T5895] hsr0: Slave B (hsr_slave_1) is not up; please bring =
it up to get a fully working HSR network
[   57.523051][ T5895] 8021q: adding VLAN 0 to HW filter on device batadv0
[   57.539669][ T5895] veth0_vlan: entered promiscuous mode
[   57.546689][ T5895] veth1_vlan: entered promiscuous mode
[   57.557686][ T5895] veth0_macvtap: entered promiscuous mode
[   57.564689][ T5895] veth1_macvtap: entered promiscuous mode
[   57.574038][ T5895] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   57.583627][ T5895] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   57.592625][ T1005] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.601383][ T1005] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.610479][ T1005] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.619249][ T1005] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   57.680555][ T1005] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   57.721144][ T1005] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
2025/11/13 07:37:01 executed programs: 0
[   57.769104][ T1005] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   57.819448][ T1005] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   60.847880][ T1005] bridge_slave_1: left allmulticast mode
[   60.856131][ T1005] bridge_slave_1: left promiscuous mode
[   60.861839][ T1005] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   60.869580][ T1005] bridge_slave_0: left allmulticast mode
[   60.875248][ T1005] bridge_slave_0: left promiscuous mode
[   60.881523][ T1005] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   60.930394][ T1005] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   60.940379][ T1005] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   60.949636][ T1005] bond0 (unregistering): Released all slaves
[   61.019603][ T1005] hsr_slave_0: left promiscuous mode
[   61.025166][ T1005] hsr_slave_1: left promiscuous mode
[   61.030851][ T1005] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   61.038360][ T1005] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   61.045838][ T1005] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   61.053628][ T1005] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   61.062820][ T1005] veth1_macvtap: left promiscuous mode
[   61.068468][ T1005] veth0_macvtap: left promiscuous mode
[   61.074011][ T1005] veth1_vlan: left promiscuous mode
[   61.079293][ T1005] veth0_vlan: left promiscuous mode
[   61.105155][ T1005] team0 (unregistering): Port device team_slave_1 remo=
ved
[   61.113500][ T1005] team0 (unregistering): Port device team_slave_0 remo=
ved
[   63.295265][ T5134] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   63.302496][ T5134] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   63.309684][ T5134] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   63.317008][ T5134] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   63.324371][ T5134] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   63.362995][ T5989] chnl_net:caif_netlink_parms(): no params data found
[   63.383696][ T5989] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   63.390958][ T5989] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   63.398237][ T5989] bridge_slave_0: entered allmulticast mode
[   63.404497][ T5989] bridge_slave_0: entered promiscuous mode
[   63.411309][ T5989] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   63.418421][ T5989] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   63.425574][ T5989] bridge_slave_1: entered allmulticast mode
[   63.431855][ T5989] bridge_slave_1: entered promiscuous mode
[   63.443227][ T5989] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   63.453005][ T5989] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   63.466713][ T5989] team0: Port device team_slave_0 added
[   63.472987][ T5989] team0: Port device team_slave_1 added
[   63.482893][ T5989] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   63.489894][ T5989] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   63.515910][ T5989] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   63.527038][ T5989] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   63.534021][ T5989] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   63.560024][ T5989] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   63.577524][ T5989] hsr_slave_0: entered promiscuous mode
[   63.583382][ T5989] hsr_slave_1: entered promiscuous mode
[   63.781644][ T5989] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   63.790644][ T5989] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   63.798849][ T5989] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   63.806845][ T5989] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   63.821643][ T5989] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   63.828815][ T5989] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   63.836059][ T5989] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   63.843125][ T5989] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   63.865285][ T5989] 8021q: adding VLAN 0 to HW filter on device bond0
[   63.875346][   T12] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   63.883832][   T12] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   63.894432][ T5989] 8021q: adding VLAN 0 to HW filter on device team0
[   63.903560][ T1005] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   63.910672][ T1005] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   63.921689][ T1005] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   63.928797][ T1005] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   63.990298][ T5989] 8021q: adding VLAN 0 to HW filter on device batadv0
[   64.009155][ T5989] veth0_vlan: entered promiscuous mode
[   64.016994][ T5989] veth1_vlan: entered promiscuous mode
[   64.032046][ T5989] veth0_macvtap: entered promiscuous mode
[   64.039726][ T5989] veth1_macvtap: entered promiscuous mode
[   64.051239][ T5989] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   64.061759][ T5989] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   64.072138][   T12] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   64.096024][   T12] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   64.113835][   T48] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   64.126167][   T48] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   64.136390][ T1005] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
SYZFAIL: failed to recv rpc
[   64.136519][   T12] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   64.152984][ T1005] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   64.154772][   T12] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
fd=3D3 want=3D4 recv=3D0 n=3D0


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build4112260622=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.24.4'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at 07e030dea6e
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D07e030dea6e6d9ca88b75bb3be2810f47083b328 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20251112-115923"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D07e030dea6e6d9ca88b75bb3be2810f47083b328 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20251112-115923"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D07e030dea6e6d9ca88b75bb3be2810f47083b328 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20251112-115923"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"07e030dea6e6d9ca88b75bb3be2810f470=
83b328\"
/usr/bin/ld: /tmp/ccqeZpgW.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         24172e0d Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcb128cd5cb43980=
9
dashboard link: https://syzkaller.appspot.com/bug?extid=3D4f5f81e1456a1f645=
bf8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils=
 for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D16573c125800=
00


