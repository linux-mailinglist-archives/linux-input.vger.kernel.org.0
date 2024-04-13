Return-Path: <linux-input+bounces-2975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFD58A3BC5
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 10:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9D71C20D61
	for <lists+linux-input@lfdr.de>; Sat, 13 Apr 2024 08:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F03D57A;
	Sat, 13 Apr 2024 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="jAI6QXOn";
	dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="m5SVqF+p"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay1-3.pub.mailoutpod2-cph3.one.com (mailrelay1-3.pub.mailoutpod2-cph3.one.com [46.30.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BA3D547
	for <linux-input@vger.kernel.org>; Sat, 13 Apr 2024 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712998433; cv=none; b=H8irRixs+Vd33zEBV+sBjdv2dKy5HjPQQ0r0NOWUHrsCkAm7u7GJtZ3wfE3K04OfdQzgfAsoYJMCxMnMW4u72w7IFkVst2hhbV8wSL1NqQYG44HzsjzoxnuhD12G/K44pC28yalpFRLrjJzG94Rg5UqUsnMpewZBC3NkuLBMzIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712998433; c=relaxed/simple;
	bh=Sob9vC73A4EGIX2O0teyqqiuC7I/1CwfOMC4nXiLs3k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7SPJ3BW7RsxY8eGcuEPSdNFCQv6PN1Gd7h0i7mgMfWLnehL5tyAVE21SEoXvnLXX19igA4VaV9jtKUVWnkL+T1+QeKDUs2ky3S7VK0NDmFRVBCc8trpNZ8ibYOnJ8Jf12YnnUfpwXz/m7qJxVA/F1eg9/HswBXL7vi6Tg/yNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com; spf=none smtp.mailfrom=carewolf.com; dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=jAI6QXOn; dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=m5SVqF+p; arc=none smtp.client-ip=46.30.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=carewolf.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=rsa2;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:date:subject:to:from:from;
	bh=FnROI32nuVx+63HNF35kT0AKdBDE+dLfvsAcP3Aszvs=;
	b=jAI6QXOnhc45RFN5o/nATFSroMRR/pfrGMLi1Q8hKhr09yVTnF4vGQ7UlJlh1dA31/LDGgd+H9Xo1
	 Afj+vM9DSOLzKVHrIGGoOGPMr8mUBhgPZtQMBNQDWUixC7Lg3LUTkbrrBrmA8QOvxoMpLQqeoYT6zv
	 bMCRdfQrvHd01/VjiAoxv2mDNNh1aAISndm0mBUb8MNkInfvooblN/sy481SVVJ/8cRAgtKCORuNPX
	 zR+mmObX9dUE3WOuUygbWomLL7ngALv4FdSi71YNfIN3zbFIt/Pu1UUPsMirdjuKkLtcyqrvLzqkW6
	 O1lX/DOmpXt4ljDnRjlLW9xXAgWpbUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=ed2;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:date:subject:to:from:from;
	bh=FnROI32nuVx+63HNF35kT0AKdBDE+dLfvsAcP3Aszvs=;
	b=m5SVqF+pa8b1hkE9VDyTsYXkIKIuagBKNps3vWwk8sogaEqXNFVm4u5lUN191+skoKUgJfD52Jzv3
	 XI2/ee9BQ==
X-HalOne-ID: 2dd45bb6-f973-11ee-b157-8b4f1ef432ad
Received: from twilight.localnet (dynamic-2a02-3103-004c-5300-4122-02a7-cbcb-6b9e.310.pool.telefonica.de [2a02:3103:4c:5300:4122:2a7:cbcb:6b9e])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 2dd45bb6-f973-11ee-b157-8b4f1ef432ad;
	Sat, 13 Apr 2024 08:52:39 +0000 (UTC)
From: Allan Sandfeld Jensen <kde@carewolf.com>
To: linux-input@vger.kernel.org,
 Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
Subject: Re: hid-logitech-dj support for Anywhere 3SB
Date: Sat, 13 Apr 2024 10:52:38 +0200
Message-ID: <10451816.nUPlyArG6x@twilight>
In-Reply-To: <7f829b15729acba79d24299da0c12cbfead175c5.camel@riseup.net>
References:
 <4887001.GXAFRqVoOG@twilight> <6038382.lOV4Wx5bFT@twilight>
 <7f829b15729acba79d24299da0c12cbfead175c5.camel@riseup.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2266597.iZASKD2KPV"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart2266597.iZASKD2KPV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday 13 April 2024 10:33:29 CEST Filipe La=C3=ADns wrote:
> On Sat, 2024-04-13 at 10:20 +0200, Allan Sandfeld Jensen wrote:
> > On Friday 12 April 2024 21:53:31 CEST Filipe La=C3=ADns wrote:
> > > On Fri, 2024-04-12 at 11:10 +0200, Allan Sandfeld Jensen wrote:
> > > > Hello,
> > > >=20
> > > > I am writing because you are listed as author of the hid-logitech-dj
> > > > driver. I recently bought a Logitech Anywhere 3SB mouse, and found
> > > > Linux
> > > > didn't recognize it. Thinking it was a simple case of new IDs not
> > > > recognized, I quickly added them to the logitch HID++ drivers (patch
> > > > attached), both for USB with the new receiver and for the Bluetooth
> > > > direct connection.
> > > >=20
> > > > I have noticed however that the patch while causing them to be
> > > > recognized
> > > > and interacted with as HID++ devices, it has a flaw. The scroll whe=
el
> > > > events are reported by the linux kernel as being in hires mode, whi=
le
> > > > haven't actually enabled it on the mouse. You can fix that using
> > > > Solaar,
> > > > but some piece is missing to enable it correctly in the driver.  Si=
nce
> > > > this is no longer a trivial fix. I wanted to reach out. Do you have
> > > > any
> > > > suggestions?
> > > >=20
> > > > Best regards
> > > > Allan
> > >=20
> > > Hi Allan,
> > >=20
> > > Thank you for reaching out.
> > >=20
> > > What likely is happening here is Solaar overwriting the configuration
> > > that
> > > the kernel driver sets, as that would happen after the driver talks to
> > > the
> > > device.
> > >=20
> > > The settings in question need support in both the kernel and the
> > > userspace
> > > input stack (libinput) for them to work appropriately, it's not like
> > > configuring RGB or other sort setting on the device that works
> > > standalone.
> >=20
> > We already have the support in the kernel and libinput. That is why I am
> > expanding it to recognize this new device id.(?)
>=20
> Yes, that sounds right.
>=20
> > > I have, multiple times now, asked for Solaar to not expose these low
> > > level
> > > settings that need support from other parts of the input stack, leavi=
ng
> > > them to the kernel to configure.
> > > I have been inactive in the Solaar project for quite some time now, s=
o I
> > > don't feel like yet again make a big deal out of this there, so that
> > > this
> > > decision is reconsidered. I have already spent a significant amount of
> > > effort there, and nowadays I barely have energy to go through my day =
and
> > > deal with my all my responsibilities and other OSS project involvemen=
ts,
> > > so
> > > I sadly have no more energy to spare there.
> > >=20
> > > My recommendation is: disable Solaar from running at startup, restart
> > > the
> > > system, and see if that solves your problem. If it does, report this
> > > issue
> > > again to the Solaar upstream, then depending on that outcome, make a
> > > decision on how to proceed. It may be that setting the high-resolution
> > > settings in Solaar, which are expected by the driver, works, but it
> > > might
> > > not be super reliable, because since Solaar is overwriting the settin=
gs
> > > configured by the kernel driver, if anything in the kernel driver
> > > changes,
> > > then the setting you have configured in Solaar might no longer be
> > > correct.
> > > There are alternatives to Solaar that do not have this issue, like
> > > libratbag, but these generally are feature lacking on the productivity
> > > line
> > > of Logitech projects.
> > >=20
> > > Sorry I wasn't able to help much, but I hope that this clarifies thin=
gs
> > > a
> > > bit, and helps you solve your problem.
> >=20
> > Thanks. You are right, it works with solaar uninstalled, I only install=
ed
> > it to check the details of a device not recognized by the kernel.
> >=20
> > So the patch as send to you before is then upstreamable. Is there anyth=
ing
> > more I need to do, to facilitate the upstreaming?
> >=20
> > Best regards
> > Allan
>=20
> Great to hear!
>=20
> The patch you sent seems pretty good for upstreaming, I would maybe just
> split the Makefile changes into a separate patch and submit those
> separately, if that's something you actually want to upstream.
> Additionally, it seems to me like the mouse can work wired, so I would al=
so
> add the USB PID of the wired connection to the hidpp driver, that way
> everything should work as expected on all interfaces.
>=20
Right. I thought I had remove those changes. I had the weirdest issue when=
=20
building the kernel, where echo wouldn't terminate. It worked when I replac=
ed=20
echo with another command, so I ended up using perl -e print. Still no idea=
, I=20
assume some interaction between my shell and the combination of quiet and e=
cho=20
in a Makefile, but it doesnt matter, not part of the patch.

It doesn't seem like the mouse communicates over the USB cable, only draws=
=20
power. This appears consistent with my old Anywhere 2S mouse.

So where should I send the patch now? It has been at least 15 years since I=
=20
contributed anything to the kernel, and I understand sending patches to the=
=20
central mailing list is frowned upon now. Do you take if from here, or do I=
=20
need to send it to a submodule maintainer above you?

Best regards
Allan


--nextPart2266597.iZASKD2KPV
Content-Disposition: attachment;
 filename="0002-Logitech-Anywhere-3SB-support.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="x-UTF_8J";
 name="0002-Logitech-Anywhere-3SB-support.patch"

From f998faa55c4f5988a958f7af50eacfcb0452451c Mon Sep 17 00:00:00 2001
From: Allan Sandfeld Jensen <allan.jensen@qt.io>
Date: Wed, 10 Apr 2024 15:23:40 +0200
Subject: [PATCH 2/2] Logitech Anywhere 3SB support

---
 drivers/hid/hid-ids.h            |  1 +
 drivers/hid/hid-logitech-dj.c    | 10 +++++++++-
 drivers/hid/hid-logitech-hidpp.c |  2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 2235d78784b1..4b79c4578d32 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -849,6 +849,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER		0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index c358778e070b..92b41ae5a47c 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -120,6 +120,7 @@ enum recvr_type {
 	recvr_type_27mhz,
 	recvr_type_bluetooth,
 	recvr_type_dinovo,
+	recvr_type_bolt,
 };
 
 struct dj_report {
@@ -1068,6 +1069,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
 	case 0x0f:
+	case 0x10:
 	case 0x11:
 		device_type = "eQUAD Lightspeed 1.2";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
@@ -1430,7 +1432,8 @@ static int logi_dj_ll_parse(struct hid_device *hid)
 		dbg_hid("%s: sending a mouse descriptor, reports_supported: %llx\n",
 			__func__, djdev->reports_supported);
 		if (djdev->dj_receiver_dev->type == recvr_type_gaming_hidpp ||
-		    djdev->dj_receiver_dev->type == recvr_type_mouse_only)
+		    djdev->dj_receiver_dev->type == recvr_type_mouse_only ||
+		    djdev->dj_receiver_dev->type == recvr_type_bolt)
 			rdcat(rdesc, &rsize, mse_high_res_descriptor,
 			      sizeof(mse_high_res_descriptor));
 		else if (djdev->dj_receiver_dev->type == recvr_type_27mhz)
@@ -1773,6 +1776,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 	case recvr_type_dj:		no_dj_interfaces = 3; break;
 	case recvr_type_hidpp:		no_dj_interfaces = 2; break;
 	case recvr_type_gaming_hidpp:	no_dj_interfaces = 3; break;
+	case recvr_type_bolt:		no_dj_interfaces = 4; break;
 	case recvr_type_mouse_only:	no_dj_interfaces = 2; break;
 	case recvr_type_27mhz:		no_dj_interfaces = 2; break;
 	case recvr_type_bluetooth:	no_dj_interfaces = 2; break;
@@ -1950,6 +1954,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2),
 	 .driver_data = recvr_type_dj},
+	{ /* Logitech bolt receiver (0xc548) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER),
+	 .driver_data = recvr_type_bolt},
 
 	{ /* Logitech Nano mouse only receiver (0xc52f) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3c00e6ac8e76..509142982daa 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4380,6 +4380,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023) },
 	{ /* MX Master 3S mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
+	{ /* MX Anywhere 3SB mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
 	{}
 };
 
-- 
2.39.2


--nextPart2266597.iZASKD2KPV--




