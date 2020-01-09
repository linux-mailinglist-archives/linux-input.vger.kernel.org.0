Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F501135B7D
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2020 15:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731697AbgAIOgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 09:36:21 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:48934 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729577AbgAIOgU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Jan 2020 09:36:20 -0500
X-Greylist: delayed 598 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 09:36:19 EST
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 47tpMG4BcBz1BJ
        for <linux-input@vger.kernel.org>; Thu,  9 Jan 2020 15:26:18 +0100 (CET)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 47tpMF10X2z1XLFjd;
        Thu,  9 Jan 2020 15:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1578579977;
        bh=B3GXyYVlRzaQLiG08KeAyn+6yIarYBIwokM7jNirM30=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=3QpH346PKW96jh23t5cGXt+LWHZ7iyanuDzIr3AnY0lqKwdK+Y5oUeE4alh9XJ8YL
         VpXthAg3ptXDH1KkItuDRJ/C+sS0kb7jj1COjj/sGjA8DBL0z+WlJ9Il13BM2fZty/
         mxXXBkPvHMV/WD2/rjWismq+7MMG6S46Iy5cdkq4=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 47tpMF0Bc4z7fY;
        Thu,  9 Jan 2020 15:26:17 +0100 (CET)
X-AuditID: 0a3aad15-79dff7000000236e-8a-5e173808fc51
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id C0.B2.09070.808371E5; Thu,  9 Jan 2020 15:26:16 +0100 (CET)
Received: from FE-MBX2049.de.bosch.com (fe-mbx2049.de.bosch.com [10.3.231.59])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 47tpMD4cHyz6CjZNg;
        Thu,  9 Jan 2020 15:26:16 +0100 (CET)
Received: from FE-MBX2049.de.bosch.com (10.3.231.59) by
 FE-MBX2049.de.bosch.com (10.3.231.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Thu, 9 Jan 2020 15:26:16 +0100
Received: from FE-MBX2049.de.bosch.com ([fe80::7145:b7a6:db9a:5829]) by
 FE-MBX2049.de.bosch.com ([fe80::7145:b7a6:db9a:5829%6]) with mapi id
 15.01.1847.005; Thu, 9 Jan 2020 15:26:16 +0100
From:   "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: [RFC] linux-input alps
Thread-Topic: [RFC] linux-input alps
Thread-Index: AdXG+Jr4i8+z4wF0QSauVKXro3Jlng==
Date:   Thu, 9 Jan 2020 14:26:16 +0000
Message-ID: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.42.180.11]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TXVAbZRSG+XaXsElZZ7Mk5DSArbGDDh3TxJYSS6cUazs4zihe+DMdQYMs
        JEoSJhtq6Y3MVGxLq1Sbgg02/AxV6jSBhv6hKDYtrdXWnxlQEuMoNheE0IKpSipC3e1Ckwvv
        3u8953nP952dJXFmL6kmzVYHa7caazQSGSHb4Ml5hDSoynU/xPMNF7omkCEQ+zvV8N43c9hm
        vGTA9UtayS3f/aXYdtnGSrbGvIO1r9n0isx09p9BrLZ12c5r3n68ATVKm5CUBHodfDE6jgma
        oVsxmD67uQnJeP05gsaPWyTiYQpBaDCGi4chBL2feVATIkkJXQztw3mCVNBF4Ox8VgjCaQ5i
        43vuhmbQKyAyNooLWkGvgrmWX9NErYWTnR5cHKyH6GknIWiC73l3/itciKToQtjf/phgIzoH
        +vq+w8V4FQTD7Zh4fxq6B0UfaCVEri+kinolXJxpxsR+LYwddkpEvRo+6oze7adoOVw5EiYO
        okxXUqwrCXElIa4kpAMRnyBlFavbYdEXrNNr7RUst0un175qs/iQ+ImU59BMpMqPMBL5UT6J
        aZTU5WhmOXNfha2y3mTkTC/b62pYTqOm3pzaV8Zk3LO5ugqLmePMNqsfAYlrFNTwGM9Rlcb6
        XazdJmJ+lEUSGhVVTT7zEkNXGx3s6yxby9qXqoUkqQHqdL6qnJHb2Wp2Z5W5xrFU1uRQKCUl
        hclMriSPxUipH60l0/nZDxbwERRXa7Rw5upFfLmIM0tuAv0aPUkejBztwsnzw+4unCGsNiur
        VlHbhBRa6DfVWe/dQ51NHdmqKGeUSYVE1iQKIBJpMqgF4RXp/B+QuAFQDcLS5ItmAnr0GM/Q
        QSlMTv+JQTy8H4eePyIEnBk5lwoD/ngaxH+8IoXA7KfpED8xT8Ht6YAc2uZuZ/DEKQW4Q98C
        +G41ZUHPvtFsOOO8vALCfy08ADf9vavAHd6dC83e6Vz48MKdXOg52fYQjLRe08LIwNQamPjt
        hg4CPwX1MPRO81rw9rWshwMRjwF8jWMb4QOnuwjeijqLYe/FA49P8uvF+PWGQkphvQ6j43/W
        u+gmXqduQEG57+oT8/22FydiVy3buxU93vSh166/Xxp7uuPhtmjgyz2ztWx96RvBMl2BenjZ
        obpLUU/QRWxRjt/ovvn8xMzRU+bfNxw71LG7ki61BKVlx+9syVX0ui8VM5sorNB34t+fi7Ye
        Pv92f9bybY7136/0Zh7Pkzw19QIxu1rizQ5FS57TEJzJqM/D7ZzxP/be9KKbBAAA
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

At the file
https://github.com/torvalds/linux/blob/master/drivers/input/mouse/alps.c
I've seen that values coming from the trackpoint/trackstick are divided at =
some devices, which results in a loss of precision.

As I was not lucky with the behavior of the trackpoint of my computer I've =
made a fork of libinput https://gitlab.freedesktop.org/leutwe/libinput/tree=
/master/
where I changed  src/filter-trackpoint.c . With this change, the values fro=
m lib evdev are multiplied by a factor (dpToFac_au16 []). The array element=
 used from dpToFac_au16 [] is also the value received by evdev.

At higher forces I use a factor much higher than 1, so the undivided value =
from the device would be the best for me.

In order not to change the behavior for other users, it might be possible t=
o change the divider at runtime via the sys- file system - like it is at tr=
ackpoint.c and take the currently used divider as default value.

Positions at source code were I see the division:

alps_process_trackstick_packet_v3()
/*
* The x and y values tend to be quite large, and when used
* alone the trackstick is difficult to use. Scale them down
* to compensate.
*/
x /=3D 8;
y /=3D 8;

alps_process_packet_v6()
/* Divide 4 since trackpoint's speed is too fast */ input_report_rel(dev2, =
REL_X, (char)x / 4); input_report_rel(dev2, REL_Y, -((char)y / 4));


Best regards
Tobias=20

