Return-Path: <linux-input+bounces-8227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB859D7B29
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 06:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5025162D51
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2024 05:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FE24AEE0;
	Mon, 25 Nov 2024 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RPfydfjG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6D22094;
	Mon, 25 Nov 2024 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512548; cv=none; b=WFWooxSVHP246GMg/7H7aFciUElfKnRfUf5K0bpYftc4XYsDnT+we50ME7Yh9KKuyh/3dZaaf4oFa3o4jDsN8UBeFW5/9Fj9lAoqJdNwWwbpD5OOmkOVyJZxeWgypMe7BCv/tHaZXv8gpWdn60YhYU2piBIVczHqDV4koD67ZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512548; c=relaxed/simple;
	bh=WhGfH44uOWuqfiQ+1HGXFTBV0xtJgZuU8WoyuTiwZ88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TsWMLXwlcQsG6TyY7s9YID2AEJ48Lb5ZC1z6r6II4PEPH2A4atehijhkFXn4wmdrSqUOsMPCwpDr5uP9irV8ghGftttRP3wj8KmP7fwrW7389F23EQO4mTF+OCidWRcdjRmTfyX0GpM7kFTMW1fKSMzdoTiTU7wL+VWv7sRjNVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RPfydfjG; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1732512440;
	bh=qFxpG8oiTuFR/oM1UavFZ1H9iDZRvho+bF3xzFS261Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RPfydfjGuMqs0o/sBdtaFgLhPDi+eBKjf85ZvXatd4R5p8phYHvu04sq109D1Twti
	 ITfNroHE1jZ8wpp5OKH4/7BbMqkp3lj+G9SMikRpas252Hh0C2T1du2Wiz4oaBZKMm
	 sOH2KA/fQyEZlM3roC9T4KIU/93zLCv7gljmHprs=
X-QQ-mid: bizesmtpsz12t1732512395t1ikju
X-QQ-Originating-IP: oVP2gR0uifCWo9pzVCTcmaT4unDvBj/p6jai9oRHTQI=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 25 Nov 2024 13:26:33 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 294461770020459058
From: WangYuli <wangyuli@uniontech.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.tissoires@redhat.com,
	jkosina@suse.cz,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Zhenxing Chen <chenzhenxing@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH] HID: wacom: fix when get product name maybe null pointer
Date: Mon, 25 Nov 2024 13:26:16 +0800
Message-ID: <B31757FE8E1544CF+20241125052616.18261-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MRY6qckr/MVJmSK1gVUht7fMUP9y2srBhDUVvM1npV73FtunHH7jOdwM
	JvUxsnSslqwRNbfFzaJvE6nWgOpKzbiHckFerq4C5TfARHyNylMpxo9lOzTVf7OWkHIe9C5
	2zUzz2MDq7AGnJUoVHj/QK45vJz42yDVo7kC/CsdfY3LLfbu8iYZMvXZ7K/HQHOGVO3WSmJ
	2VWTvJI5/1UUXYFcrKYxQkC6wt1Jf3hnI+zHsnWNLHPKN7u9+lcGUHxwbK1oETOUtl8u6Wi
	6a0utFDMx2Y4y29NLymc+WPPxatHLXf1gyn+UUFAbevRma3D8TtPLCUeHisdQZ0sMOR3hp3
	pxeVsEdDaxPDs1YUpKRDUHY7nd6OO7jDuPCCwDJBBxRhRMIlgvhLLTW71hqlT94+cg7aqYw
	QMTmr1uBFrCpRfy4feAZPSiQMOEiH4Bj/RNDKAMvYS2ZhP6jpl7ys1ZiHcD41qYdOZfTvOX
	CiliGQkbCqbYCZuzAQM3WxZGhz9n6H1d+2bbudGmB7yP7+XqpLHrtSFs+BAxf/75Jy7ZZXl
	NmZ3cdQI/cSN0TYJGfhTTI02+r28VRKq+aqTdxcUwUDlx8cefilurViFaMx8ullIkHMDqiT
	lKcz8W4x4GWf7GIfQX0xyPyt7MttkgKEGLtSWXlUX4woNFjcEraQefHiACMxDGVGtWf7AWy
	tBJxx1ESAtqJ5aIh5UjAnCSpzDQ5DvsWEdla0KC4Nj0iZIv2zl9RtDeXB3xHg//9DER5yBB
	RE5bZxHr82Z2gfJThjnVrLX60huMLO1xJKSciWlJv3BBZ9Py+y1VlLBA27pQJCOHIUD5cjn
	a5BZc9ao+S5VSHGRvqubC7soAynzMrpjq6uIJ+n7ra8d0Q+n7AkHLQm0OyQ5RYYaHf4lnyF
	xm5P90bbclGY8mQqrXMTHmkZmo9A15VKM6CKLGbg1x9QHVoZZJPqoYlNpmkO2Wa+x2klWtD
	lVwuipZJf0oEHoueZejrs8AS4V7W7rNeffD0nWEV5PUOTmySny10kIcxDbdZDrsF+9zGZGs
	OMI+nepf2K1TJA+QNI3wHX4OjgQeBVwBwNur/RZA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Due to incorrect dev->product reporting by certain devices, null
pointer dereferences occur when dev->product is empty, leading to
potential system crashes.

This issue was found on EXCELSIOR DL37-D05 device with
Loongson-LS3A6000-7A2000-DL37 motherboard.

Kernel logs:
[   56.470885] usb 4-3: new full-speed USB device number 4 using ohci-pci
[   56.671638] usb 4-3: string descriptor 0 read error: -22
[   56.671644] usb 4-3: New USB device found, idVendor=056a, idProduct=0374, bcdDevice= 1.07
[   56.671647] usb 4-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   56.678839] hid-generic 0003:056A:0374.0004: hiddev0,hidraw3: USB HID v1.10 Device [HID 056a:0374] on usb-0000:00:05.0-3/input0
[   56.697719] CPU 2 Unable to handle kernel paging request at virtual address 0000000000000000, era == 90000000066e35c8, ra == ffff800004f98a80
[   56.697732] Oops[#1]:
[   56.697734] CPU: 2 PID: 2742 Comm: (udev-worker) Tainted: G           OE      6.6.0-loong64-desktop #25.00.2000.015
[   56.697737] Hardware name: Inspur CE520L2/C09901N000000000, BIOS 2.09.00 10/11/2024
[   56.697739] pc 90000000066e35c8 ra ffff800004f98a80 tp 9000000125478000 sp 900000012547b8a0
[   56.697741] a0 0000000000000000 a1 ffff800004818b28 a2 0000000000000000 a3 0000000000000000
[   56.697743] a4 900000012547b8f0 a5 0000000000000000 a6 0000000000000000 a7 0000000000000000
[   56.697745] t0 ffff800004818b2d t1 0000000000000000 t2 0000000000000003 t3 0000000000000005
[   56.697747] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
[   56.697748] t8 0000000000000000 u0 0000000000000000 s9 0000000000000000 s0 900000011aa48028
[   56.697750] s1 0000000000000000 s2 0000000000000000 s3 ffff800004818e80 s4 ffff800004810000
[   56.697751] s5 90000001000b98d0 s6 ffff800004811f88 s7 ffff800005470440 s8 0000000000000000
[   56.697753]    ra: ffff800004f98a80 wacom_update_name+0xe0/0x300 [wacom]
[   56.697802]   ERA: 90000000066e35c8 strstr+0x28/0x120
[   56.697806]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[   56.697816]  PRMD: 0000000c (PPLV0 +PIE +PWE)
[   56.697821]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[   56.697827]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[   56.697831] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
[   56.697835]  BADV: 0000000000000000
[   56.697836]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000)
[   56.697838] Modules linked in: wacom(+) bnep bluetooth rfkill qrtr nls_iso8859_1 nls_cp437 snd_hda_codec_conexant snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore input_leds mousedev led_class joydev deepin_netmonitor(OE) fuse nfnetlink dmi_sysfs ip_tables x_tables overlay amdgpu amdxcp drm_exec gpu_sched drm_buddy radeon drm_suballoc_helper i2c_algo_bit drm_ttm_helper r8169 ttm drm_display_helper spi_loongson_pci xhci_pci cec xhci_pci_renesas spi_loongson_core hid_generic realtek gpio_loongson_64bit
[   56.697887] Process (udev-worker) (pid: 2742, threadinfo=00000000aee0d8b4, task=00000000a9eff1f3)
[   56.697890] Stack : 0000000000000000 ffff800004817e00 0000000000000000 0000251c00000000
[   56.697896]         0000000000000000 00000011fffffffd 0000000000000000 0000000000000000
[   56.697901]         0000000000000000 1b67a968695184b9 0000000000000000 90000001000b98d0
[   56.697906]         90000001000bb8d0 900000011aa48028 0000000000000000 ffff800004f9d74c
[   56.697911]         90000001000ba000 ffff800004f9ce58 0000000000000000 ffff800005470440
[   56.697916]         ffff800004811f88 90000001000b98d0 9000000100da2aa8 90000001000bb8d0
[   56.697921]         0000000000000000 90000001000ba000 900000011aa48028 ffff800004f9d74c
[   56.697926]         ffff8000054704e8 90000001000bb8b8 90000001000ba000 0000000000000000
[   56.697931]         90000001000bb8d0 9000000006307564 9000000005e666e0 90000001752359b8
[   56.697936]         9000000008cbe400 900000000804d000 9000000005e666e0 0000000000000000
[   56.697941]         ...
[   56.697944] Call Trace:
[   56.697945] [<90000000066e35c8>] strstr+0x28/0x120
[   56.697950] [<ffff800004f98a80>] wacom_update_name+0xe0/0x300 [wacom]
[   56.698000] [<ffff800004f9ce58>] wacom_parse_and_register+0x338/0x900 [wacom]
[   56.698050] [<ffff800004f9d74c>] wacom_probe+0x32c/0x420 [wacom]
[   56.698099] [<9000000006307564>] hid_device_probe+0x144/0x260
[   56.698103] [<9000000005e65d68>] really_probe+0x208/0x540
[   56.698109] [<9000000005e661dc>] __driver_probe_device+0x13c/0x1e0
[   56.698112] [<9000000005e66620>] driver_probe_device+0x40/0x100
[   56.698116] [<9000000005e6680c>] __device_attach_driver+0x12c/0x180
[   56.698119] [<9000000005e62bc8>] bus_for_each_drv+0x88/0x160
[   56.698123] [<9000000005e66468>] __device_attach+0x108/0x260
[   56.698126] [<9000000005e63918>] device_reprobe+0x78/0x100
[   56.698129] [<9000000005e62a68>] bus_for_each_dev+0x88/0x160
[   56.698132] [<9000000006304e54>] __hid_bus_driver_added+0x34/0x80
[   56.698134] [<9000000005e62bc8>] bus_for_each_drv+0x88/0x160
[   56.698137] [<9000000006304df0>] __hid_register_driver+0x70/0xa0
[   56.698142] [<9000000004e10fe4>] do_one_initcall+0x104/0x320
[   56.698146] [<9000000004f38150>] do_init_module+0x90/0x2c0
[   56.698151] [<9000000004f3a3d8>] init_module_from_file+0xb8/0x120
[   56.698155] [<9000000004f3a590>] idempotent_init_module+0x150/0x3a0
[   56.698159] [<9000000004f3a890>] sys_finit_module+0xb0/0x140
[   56.698163] [<900000000671e4e8>] do_syscall+0x88/0xc0
[   56.698166] [<9000000004e12404>] handle_syscall+0xc4/0x160
[   56.698171] Code: 0011958f  00150224  5800cd85 <2a00022c> 00150004  4000c180  0015022c  03400000  03400000
[   56.698192] ---[ end trace 0000000000000000 ]---

Fixes: 09dc28acaec7 ("HID: wacom: Improve generic name generation")
Reported-by: Zhenxing Chen <chenzhenxing@uniontech.com>
Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/hid/wacom_sys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 2bc45b24075c..9843b52bd017 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2241,7 +2241,8 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
 		if (hid_is_usb(wacom->hdev)) {
 			struct usb_interface *intf = to_usb_interface(wacom->hdev->dev.parent);
 			struct usb_device *dev = interface_to_usbdev(intf);
-			product_name = dev->product;
+			if (dev->product != NULL)
+				product_name = dev->product;
 		}
 
 		if (wacom->hdev->bus == BUS_I2C) {
-- 
2.45.2


