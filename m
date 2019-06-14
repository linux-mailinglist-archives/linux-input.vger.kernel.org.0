Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597C4461A0
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfFNOvf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 10:51:35 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45334 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfFNOvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 10:51:32 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190614145130euoutp01991adc4845725b3fcd76552df97d519d~oGDXPytGH0373703737euoutp01I
        for <linux-input@vger.kernel.org>; Fri, 14 Jun 2019 14:51:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190614145130euoutp01991adc4845725b3fcd76552df97d519d~oGDXPytGH0373703737euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560523890;
        bh=JOBPioqs4RrCGev7QSFsmwasUTaVfRn9yWznF+xOAl8=;
        h=From:Subject:To:Cc:Date:References:From;
        b=MZCZYak/0Ax6+BQOiEej2oujOBt/H6sdAvyWKg72Qcy8qgImcqVcAnvvnn19P7gZC
         WrJqHoyrk1s2sPgA5Do66SrtQszHKcXzPLoKtSTEmDmzyejEz6jcNuNL5FlBp+YiHE
         HmEAMU2JLzw4svi2XBBNq9uRVvtRjiRxbCSdvgZw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190614145129eucas1p17434fd4d8a8fa4ce18f5dec420fcb3fe~oGDWmud6Q1569315693eucas1p1k;
        Fri, 14 Jun 2019 14:51:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 4E.BA.04298.174B30D5; Fri, 14
        Jun 2019 15:51:29 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190614145128eucas1p2783e7d644ef8823d211896298e8988fc~oGDV3PT-f0434204342eucas1p2X;
        Fri, 14 Jun 2019 14:51:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190614145128eusmtrp2cd20ed67485f1ec93002fdc2ea7a9786~oGDVnohVM3000730007eusmtrp2g;
        Fri, 14 Jun 2019 14:51:28 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-7d-5d03b471dab7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 56.FE.04140.074B30D5; Fri, 14
        Jun 2019 15:51:28 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190614145128eusmtip1fa464a7ac784f9b4769b283e53ae3b16~oGDVNNmuu2910429104eusmtip1P;
        Fri, 14 Jun 2019 14:51:28 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 3/3] video: fbdev: don't print error message on
 framebuffer_alloc() failure
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Message-ID: <3da197ed-a701-2aa7-d775-2bdbe9deab4a@samsung.com>
Date:   Fri, 14 Jun 2019 16:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7qFW5hjDTY0C1tcn7KZ1eLcpNfM
        Fle+vmezuHW8ldHiRN8HVoubn76xWlzeNYfNgd1j06pONo83cwU87ncfZ/J4v+8qm8fnTXIB
        rFFcNimpOZllqUX6dglcGWfW3mUvmHaasaL36kmmBsaW5YxdjBwcEgImEhe6WbsYuTiEBFYw
        SvyeupERwvnCKDH/22wo5zOjxOXtzUBlnGAdp6YvYwexhQSWM0osOR8EUfSWUeLYv+dMIAk2
        ASuJie2rwFYIC8RKPJxYBhIWEaiVmN/QxwRSzywwhVFi5+HDYEN5Bewkbm9fATaURUBVomn3
        FmYQW1QgQuL+sQ1QNYISJ2c+YQGxmQXEJW49mc8EYctLNG+dzQwyVEJgHrvEuj1XmCEudZH4
        0tTBBGELS7w6voUdwpaR+L9zPhNEwzpGib8dL6C6tzNKLJ/8jw2iylri8PGLrCAvMAtoSqzf
        pQ8RdpTYcOoyOyTw+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iQ3LNrDBrO3auRLqNA+JqV9P
        sE1gVJyF5LVZSF6bheS1WQg3LGBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGYhE7/
        O/5pB+PXS0mHGAU4GJV4eGf0MccKsSaWFVfmHmKU4GBWEuGdZw0U4k1JrKxKLcqPLyrNSS0+
        xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwFjkkb6bh+H7n853eyf+a3e7xr1a/1f3
        tfAXy1wu3i0oK/6f8kdjvdtjpm3y009x21zpXNz3+pZk3ypdT96nuzfrPl4iXczBOfdV4sld
        +zeyNp5eoNjuWaC3qXv6yVVRhz7fmGxt9vlQncXymPUmN5a/fvJxukiZyvWUtVMYvmdK8vh4
        7v3brL9LiaU4I9FQi7moOBEAKxLHRD4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7oFW5hjDbY+k7a4PmUzq8W5Sa+Z
        La58fc9mcet4K6PFib4PrBY3P31jtbi8aw6bA7vHplWdbB5v5gp43O8+zuTxft9VNo/Pm+QC
        WKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Ms6s
        vcteMO00Y0Xv1ZNMDYwtyxm7GDk5JARMJE5NX8bexcjFISSwlFHi69dJLF2MHEAJGYnj68sg
        aoQl/lzrYgOxhQReM0p8+28CYrMJWElMbF/FCFIuLBAr8XAiWLmIQK3ExOX/WUBGMgtMY5Q4
        3NfMDJLgFbCTuL19BTuIzSKgKtG0ewtYXFQgQuLM+xUsEDWCEidnPgGzmQXUJf7Mu8QMYYtL
        3HoynwnClpdo3jqbeQKjwCwkLbOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5
        uZsYgTG07djPLTsYu94FH2IU4GBU4uGd0cccK8SaWFZcmXuIUYKDWUmEd541UIg3JbGyKrUo
        P76oNCe1+BCjKdBDE5mlRJPzgfGdVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUg
        tQimj4mDU6qB0U8/dfKqlUlXRY/unpuX+sF6QZB26Qb3vO1y1SJpD6RF+sSK+p2U99bu6HIP
        OJxpM/czy+RpERYuoXFv8oJ+n3a9c20P1zSr4L08V86z7NM7KqAX/HW7fIF1k0hY5RWOULdv
        XQvfOwk0bug+selK3Va/EM0X66Q+l2q4Mf15dWNxTWWyt8dbJZbijERDLeai4kQAJ/2NTrcC
        AAA=
X-CMS-MailID: 20190614145128eucas1p2783e7d644ef8823d211896298e8988fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190614145128eucas1p2783e7d644ef8823d211896298e8988fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614145128eucas1p2783e7d644ef8823d211896298e8988fc
References: <CGME20190614145128eucas1p2783e7d644ef8823d211896298e8988fc@eucas1p2.samsung.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

framebuffer_alloc() can fail only on kzalloc() memory allocation
failure and since kzalloc() will print error message in such case
we can omit printing extra error message in drivers (which BTW is
what the majority of framebuffer_alloc() users is doing already).

Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/hid/hid-picolcd_fb.c                   |    4 +---
 drivers/video/fbdev/amifb.c                    |    4 +---
 drivers/video/fbdev/arkfb.c                    |    4 +---
 drivers/video/fbdev/atmel_lcdfb.c              |    4 +---
 drivers/video/fbdev/aty/aty128fb.c             |    5 ++---
 drivers/video/fbdev/aty/atyfb_base.c           |   10 ++++------
 drivers/video/fbdev/aty/radeon_base.c          |    2 --
 drivers/video/fbdev/chipsfb.c                  |    1 -
 drivers/video/fbdev/cirrusfb.c                 |    5 +----
 drivers/video/fbdev/da8xx-fb.c                 |    1 -
 drivers/video/fbdev/efifb.c                    |    1 -
 drivers/video/fbdev/grvga.c                    |    4 +---
 drivers/video/fbdev/gxt4500.c                  |    5 ++---
 drivers/video/fbdev/hyperv_fb.c                |    4 +---
 drivers/video/fbdev/i740fb.c                   |    4 +---
 drivers/video/fbdev/imsttfb.c                  |    5 +----
 drivers/video/fbdev/intelfb/intelfbdrv.c       |    5 ++---
 drivers/video/fbdev/jz4740_fb.c                |    4 +---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     |    5 +----
 drivers/video/fbdev/mbx/mbxfb.c                |    4 +---
 drivers/video/fbdev/omap/omapfb_main.c         |    2 --
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c |    6 +-----
 drivers/video/fbdev/platinumfb.c               |    5 ++---
 drivers/video/fbdev/pmag-aa-fb.c               |    4 +---
 drivers/video/fbdev/pmag-ba-fb.c               |    4 +---
 drivers/video/fbdev/pmagb-b-fb.c               |    4 +---
 drivers/video/fbdev/pvr2fb.c                   |    6 +-----
 drivers/video/fbdev/riva/fbdev.c               |    1 -
 drivers/video/fbdev/s3c-fb.c                   |    4 +---
 drivers/video/fbdev/s3fb.c                     |    4 +---
 drivers/video/fbdev/sh_mobile_lcdcfb.c         |    8 ++------
 drivers/video/fbdev/sm501fb.c                  |    4 +---
 drivers/video/fbdev/sm712fb.c                  |    1 -
 drivers/video/fbdev/smscufx.c                  |    4 +---
 drivers/video/fbdev/ssd1307fb.c                |    4 +---
 drivers/video/fbdev/sunxvr1000.c               |    1 -
 drivers/video/fbdev/sunxvr2500.c               |    1 -
 drivers/video/fbdev/sunxvr500.c                |    1 -
 drivers/video/fbdev/tgafb.c                    |    4 +---
 drivers/video/fbdev/udlfb.c                    |    4 +---
 drivers/video/fbdev/via/viafbdev.c             |    6 +-----
 drivers/video/fbdev/vt8623fb.c                 |    4 +---
 42 files changed, 40 insertions(+), 123 deletions(-)

Index: b/drivers/hid/hid-picolcd_fb.c
===================================================================
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -522,10 +522,8 @@ int picolcd_init_framebuffer(struct pico
 			sizeof(struct fb_deferred_io) +
 			sizeof(struct picolcd_fb_data) +
 			PICOLCDFB_SIZE, dev);
-	if (info == NULL) {
-		dev_err(dev, "failed to allocate a framebuffer\n");
+	if (!info)
 		goto err_nomem;
-	}
 
 	info->fbdefio = info->par;
 	*info->fbdefio = picolcd_fb_defio;
Index: b/drivers/video/fbdev/amifb.c
===================================================================
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3554,10 +3554,8 @@ static int __init amifb_probe(struct pla
 	custom.dmacon = DMAF_ALL | DMAF_MASTER;
 
 	info = framebuffer_alloc(sizeof(struct amifb_par), &pdev->dev);
-	if (!info) {
-		dev_err(&pdev->dev, "framebuffer_alloc failed\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	strcpy(info->fix.id, "Amiga ");
 	info->fix.visual = FB_VISUAL_PSEUDOCOLOR;
Index: b/drivers/video/fbdev/arkfb.c
===================================================================
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -954,10 +954,8 @@ static int ark_pci_probe(struct pci_dev
 
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct arkfb_info), &(dev->dev));
-	if (! info) {
-		dev_err(&(dev->dev), "cannot allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	mutex_init(&par->open_lock);
Index: b/drivers/video/fbdev/atmel_lcdfb.c
===================================================================
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1053,10 +1053,8 @@ static int __init atmel_lcdfb_probe(stru
 
 	ret = -ENOMEM;
 	info = framebuffer_alloc(sizeof(struct atmel_lcdfb_info), dev);
-	if (!info) {
-		dev_err(dev, "cannot allocate memory\n");
+	if (!info)
 		goto out;
-	}
 
 	sinfo = info->par;
 	sinfo->pdev = pdev;
Index: b/drivers/video/fbdev/aty/aty128fb.c
===================================================================
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2102,10 +2102,9 @@ static int aty128_probe(struct pci_dev *
 
 	/* We have the resources. Now virtualize them */
 	info = framebuffer_alloc(sizeof(struct aty128fb_par), &pdev->dev);
-	if (info == NULL) {
-		printk(KERN_ERR "aty128fb: can't alloc fb_info_aty128\n");
+	if (!info)
 		goto err_free_mmio;
-	}
+
 	par = info->par;
 
 	info->pseudo_palette = par->pseudo_palette;
Index: b/drivers/video/fbdev/aty/atyfb_base.c
===================================================================
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3550,10 +3550,9 @@ static int atyfb_pci_probe(struct pci_de
 
 	/* Allocate framebuffer */
 	info = framebuffer_alloc(sizeof(struct atyfb_par), &pdev->dev);
-	if (!info) {
-		PRINTKE("atyfb_pci_probe() can't alloc fb_info\n");
+	if (!info)
 		return -ENOMEM;
-	}
+
 	par = info->par;
 	par->bus_type = PCI;
 	info->fix = atyfb_fix;
@@ -3643,10 +3642,9 @@ static int __init atyfb_atari_probe(void
 		}
 
 		info = framebuffer_alloc(sizeof(struct atyfb_par), NULL);
-		if (!info) {
-			PRINTKE("atyfb_atari_probe() can't alloc fb_info\n");
+		if (!info)
 			return -ENOMEM;
-		}
+
 		par = info->par;
 
 		info->fix = atyfb_fix;
Index: b/drivers/video/fbdev/aty/radeon_base.c
===================================================================
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2294,8 +2294,6 @@ static int radeonfb_pci_register(struct
 
 	info = framebuffer_alloc(sizeof(struct radeonfb_info), &pdev->dev);
 	if (!info) {
-		printk (KERN_ERR "radeonfb (%s): could not allocate memory\n",
-			pci_name(pdev));
 		ret = -ENOMEM;
 		goto err_disable;
 	}
Index: b/drivers/video/fbdev/chipsfb.c
===================================================================
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -366,7 +366,6 @@ static int chipsfb_pci_init(struct pci_d
 
 	p = framebuffer_alloc(0, &dp->dev);
 	if (p == NULL) {
-		dev_err(&dp->dev, "Cannot allocate framebuffer structure\n");
 		rc = -ENOMEM;
 		goto err_disable;
 	}
Index: b/drivers/video/fbdev/cirrusfb.c
===================================================================
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2093,7 +2093,6 @@ static int cirrusfb_pci_register(struct
 
 	info = framebuffer_alloc(sizeof(struct cirrusfb_info), &pdev->dev);
 	if (!info) {
-		printk(KERN_ERR "cirrusfb: could not allocate memory\n");
 		ret = -ENOMEM;
 		goto err_out;
 	}
@@ -2206,10 +2205,8 @@ static int cirrusfb_zorro_register(struc
 	struct cirrusfb_info *cinfo;
 
 	info = framebuffer_alloc(sizeof(struct cirrusfb_info), &z->dev);
-	if (!info) {
-		printk(KERN_ERR "cirrusfb: could not allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	zcl = (const struct zorrocl *)ent->driver_data;
 	btype = zcl->type;
Index: b/drivers/video/fbdev/da8xx-fb.c
===================================================================
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1400,7 +1400,6 @@ static int fb_probe(struct platform_devi
 	da8xx_fb_info = framebuffer_alloc(sizeof(struct da8xx_fb_par),
 					&device->dev);
 	if (!da8xx_fb_info) {
-		dev_dbg(&device->dev, "Memory allocation failed for fb_info\n");
 		ret = -ENOMEM;
 		goto err_pm_runtime_disable;
 	}
Index: b/drivers/video/fbdev/efifb.c
===================================================================
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -448,7 +448,6 @@ static int efifb_probe(struct platform_d
 
 	info = framebuffer_alloc(sizeof(u32) * 16, &dev->dev);
 	if (!info) {
-		pr_err("efifb: cannot allocate framebuffer\n");
 		err = -ENOMEM;
 		goto err_release_mem;
 	}
Index: b/drivers/video/fbdev/grvga.c
===================================================================
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -341,10 +341,8 @@ static int grvga_probe(struct platform_d
 	char *options = NULL, *mode_opt = NULL;
 
 	info = framebuffer_alloc(sizeof(struct grvga_par), &dev->dev);
-	if (!info) {
-		dev_err(&dev->dev, "framebuffer_alloc failed\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	/* Expecting: "grvga: modestring, [addr:<framebuffer physical address>], [size:<framebuffer size>]
 	 *
Index: b/drivers/video/fbdev/gxt4500.c
===================================================================
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -642,10 +642,9 @@ static int gxt4500_probe(struct pci_dev
 	}
 
 	info = framebuffer_alloc(sizeof(struct gxt4500_par), &pdev->dev);
-	if (!info) {
-		dev_err(&pdev->dev, "gxt4500: cannot alloc FB info record\n");
+	if (!info)
 		goto err_free_fb;
-	}
+
 	par = info->par;
 	cardtype = ent->driver_data;
 	par->refclk_ps = cardinfo[cardtype].refclk_ps;
Index: b/drivers/video/fbdev/hyperv_fb.c
===================================================================
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -771,10 +771,8 @@ static int hvfb_probe(struct hv_device *
 	int ret;
 
 	info = framebuffer_alloc(sizeof(struct hvfb_par), &hdev->device);
-	if (!info) {
-		pr_err("No memory for framebuffer info\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	par->info = info;
Index: b/drivers/video/fbdev/i740fb.c
===================================================================
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1005,10 +1005,8 @@ static int i740fb_probe(struct pci_dev *
 	u8 *edid;
 
 	info = framebuffer_alloc(sizeof(struct i740fb_par), &(dev->dev));
-	if (!info) {
-		dev_err(&(dev->dev), "cannot allocate framebuffer\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	mutex_init(&par->open_lock);
Index: b/drivers/video/fbdev/imsttfb.c
===================================================================
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1477,11 +1477,8 @@ static int imsttfb_probe(struct pci_dev
 		printk(KERN_ERR "imsttfb: no OF node for pci device\n");
 
 	info = framebuffer_alloc(sizeof(struct imstt_par), &pdev->dev);
-
-	if (!info) {
-		printk(KERN_ERR "imsttfb: Can't allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 
Index: b/drivers/video/fbdev/intelfb/intelfbdrv.c
===================================================================
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -491,10 +491,9 @@ static int intelfb_pci_register(struct p
 	}
 
 	info = framebuffer_alloc(sizeof(struct intelfb_info), &pdev->dev);
-	if (!info) {
-		ERR_MSG("Could not allocate memory for intelfb_info.\n");
+	if (!info)
 		return -ENOMEM;
-	}
+
 	if (fb_alloc_cmap(&info->cmap, 256, 1) < 0) {
 		ERR_MSG("Could not allocate cmap for intelfb_info.\n");
 		goto err_out_cmap;
Index: b/drivers/video/fbdev/jz4740_fb.c
===================================================================
--- a/drivers/video/fbdev/jz4740_fb.c
+++ b/drivers/video/fbdev/jz4740_fb.c
@@ -544,10 +544,8 @@ static int jzfb_probe(struct platform_de
 	}
 
 	fb = framebuffer_alloc(sizeof(struct jzfb), &pdev->dev);
-	if (!fb) {
-		dev_err(&pdev->dev, "Failed to allocate framebuffer device\n");
+	if (!fb)
 		return -ENOMEM;
-	}
 
 	fb->fbops = &jzfb_ops;
 	fb->flags = FBINFO_DEFAULT;
Index: b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
===================================================================
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -684,10 +684,8 @@ static int of_platform_mb862xx_probe(str
 	}
 
 	info = framebuffer_alloc(sizeof(struct mb862xxfb_par), dev);
-	if (info == NULL) {
-		dev_err(dev, "cannot allocate framebuffer\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	par->info = info;
@@ -1009,7 +1007,6 @@ static int mb862xx_pci_probe(struct pci_
 
 	info = framebuffer_alloc(sizeof(struct mb862xxfb_par), dev);
 	if (!info) {
-		dev_err(dev, "framebuffer alloc failed\n");
 		ret = -ENOMEM;
 		goto dis_dev;
 	}
Index: b/drivers/video/fbdev/mbx/mbxfb.c
===================================================================
--- a/drivers/video/fbdev/mbx/mbxfb.c
+++ b/drivers/video/fbdev/mbx/mbxfb.c
@@ -899,10 +899,8 @@ static int mbxfb_probe(struct platform_d
 	}
 
 	fbi = framebuffer_alloc(sizeof(struct mbxfb_info), &dev->dev);
-	if (fbi == NULL) {
-		dev_err(&dev->dev, "framebuffer_alloc failed\n");
+	if (!fbi)
 		return -ENOMEM;
-	}
 
 	mfbi = fbi->par;
 	fbi->pseudo_palette = mfbi->pseudo_palette;
Index: b/drivers/video/fbdev/omap/omapfb_main.c
===================================================================
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1515,8 +1515,6 @@ static int planes_init(struct omapfb_dev
 		fbi = framebuffer_alloc(sizeof(struct omapfb_plane_struct),
 					fbdev->dev);
 		if (fbi == NULL) {
-			dev_err(fbdev->dev,
-				"unable to allocate memory for plane info\n");
 			planes_cleanup(fbdev);
 			return -ENOMEM;
 		}
Index: b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1892,12 +1892,8 @@ static int omapfb_create_framebuffers(st
 
 		fbi = framebuffer_alloc(sizeof(struct omapfb_info),
 				fbdev->dev);
-
-		if (fbi == NULL) {
-			dev_err(fbdev->dev,
-				"unable to allocate memory for plane info\n");
+		if (!fbi)
 			return -ENOMEM;
-		}
 
 		clear_fb_info(fbi);
 
Index: b/drivers/video/fbdev/platinumfb.c
===================================================================
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -538,10 +538,9 @@ static int platinumfb_probe(struct platf
 	dev_info(&odev->dev, "Found Apple Platinum video hardware\n");
 
 	info = framebuffer_alloc(sizeof(*pinfo), &odev->dev);
-	if (info == NULL) {
-		dev_err(&odev->dev, "Failed to allocate fbdev !\n");
+	if (!info)
 		return -ENOMEM;
-	}
+
 	pinfo = info->par;
 
 	if (of_address_to_resource(dp, 0, &pinfo->rsrc_reg) ||
Index: b/drivers/video/fbdev/pmag-aa-fb.c
===================================================================
--- a/drivers/video/fbdev/pmag-aa-fb.c
+++ b/drivers/video/fbdev/pmag-aa-fb.c
@@ -165,10 +165,8 @@ static int pmagaafb_probe(struct device
 	int err;
 
 	info = framebuffer_alloc(sizeof(struct aafb_par), dev);
-	if (!info) {
-		printk(KERN_ERR "%s: Cannot allocate memory\n", dev_name(dev));
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	dev_set_drvdata(dev, info);
Index: b/drivers/video/fbdev/pmag-ba-fb.c
===================================================================
--- a/drivers/video/fbdev/pmag-ba-fb.c
+++ b/drivers/video/fbdev/pmag-ba-fb.c
@@ -150,10 +150,8 @@ static int pmagbafb_probe(struct device
 	int err;
 
 	info = framebuffer_alloc(sizeof(struct pmagbafb_par), dev);
-	if (!info) {
-		printk(KERN_ERR "%s: Cannot allocate memory\n", dev_name(dev));
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	dev_set_drvdata(dev, info);
Index: b/drivers/video/fbdev/pmagb-b-fb.c
===================================================================
--- a/drivers/video/fbdev/pmagb-b-fb.c
+++ b/drivers/video/fbdev/pmagb-b-fb.c
@@ -257,10 +257,8 @@ static int pmagbbfb_probe(struct device
 	int err;
 
 	info = framebuffer_alloc(sizeof(struct pmagbbfb_par), dev);
-	if (!info) {
-		printk(KERN_ERR "%s: Cannot allocate memory\n", dev_name(dev));
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	dev_set_drvdata(dev, info);
Index: b/drivers/video/fbdev/pvr2fb.c
===================================================================
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1069,12 +1069,8 @@ static int __init pvr2fb_init(void)
 #endif
 
 	fb_info = framebuffer_alloc(sizeof(struct pvr2fb_par), NULL);
-
-	if (!fb_info) {
-		printk(KERN_ERR "Failed to allocate memory for fb_info\n");
+	if (!fb_info)
 		return -ENOMEM;
-	}
-
 
 	currentpar = fb_info->par;
 
Index: b/drivers/video/fbdev/riva/fbdev.c
===================================================================
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1902,7 +1902,6 @@ static int rivafb_probe(struct pci_dev *
 
 	info = framebuffer_alloc(sizeof(struct riva_par), &pd->dev);
 	if (!info) {
-		printk (KERN_ERR PFX "could not allocate memory\n");
 		ret = -ENOMEM;
 		goto err_ret;
 	}
Index: b/drivers/video/fbdev/s3c-fb.c
===================================================================
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1189,10 +1189,8 @@ static int s3c_fb_probe_win(struct s3c_f
 
 	fbinfo = framebuffer_alloc(sizeof(struct s3c_fb_win) +
 				   palette_size * sizeof(u32), sfb->dev);
-	if (!fbinfo) {
-		dev_err(sfb->dev, "failed to allocate framebuffer\n");
+	if (!fbinfo)
 		return -ENOMEM;
-	}
 
 	windata = sfb->pdata->win[win_no];
 	initmode = *sfb->pdata->vtiming;
Index: b/drivers/video/fbdev/s3fb.c
===================================================================
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1128,10 +1128,8 @@ static int s3_pci_probe(struct pci_dev *
 
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct s3fb_info), &(dev->dev));
-	if (!info) {
-		dev_err(&(dev->dev), "cannot allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	mutex_init(&par->open_lock);
Index: b/drivers/video/fbdev/sh_mobile_lcdcfb.c
===================================================================
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1644,10 +1644,8 @@ sh_mobile_lcdc_overlay_fb_init(struct sh
 
 	/* Allocate and initialize the frame buffer device. */
 	info = framebuffer_alloc(0, priv->dev);
-	if (info == NULL) {
-		dev_err(priv->dev, "unable to allocate fb_info\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	ovl->info = info;
 
@@ -2138,10 +2136,8 @@ sh_mobile_lcdc_channel_fb_init(struct sh
 	 * list and allocate the color map.
 	 */
 	info = framebuffer_alloc(0, priv->dev);
-	if (info == NULL) {
-		dev_err(priv->dev, "unable to allocate fb_info\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	ch->info = info;
 
Index: b/drivers/video/fbdev/sm501fb.c
===================================================================
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1868,10 +1868,8 @@ static int sm501fb_probe_one(struct sm50
 	}
 
 	fbi = framebuffer_alloc(sizeof(struct sm501fb_par), info->dev);
-	if (fbi == NULL) {
-		dev_err(info->dev, "cannot allocate %s framebuffer\n", name);
+	if (!fbi)
 		return -ENOMEM;
-	}
 
 	par = fbi->par;
 	par->info = info;
Index: b/drivers/video/fbdev/sm712fb.c
===================================================================
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1538,7 +1538,6 @@ static int smtcfb_pci_probe(struct pci_d
 
 	info = framebuffer_alloc(sizeof(*sfb), &pdev->dev);
 	if (!info) {
-		dev_err(&pdev->dev, "framebuffer_alloc failed\n");
 		err = -ENOMEM;
 		goto failed_free;
 	}
Index: b/drivers/video/fbdev/smscufx.c
===================================================================
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1653,10 +1653,8 @@ static int ufx_usb_probe(struct usb_inte
 
 	/* allocates framebuffer driver structure, not framebuffer memory */
 	info = framebuffer_alloc(0, &usbdev->dev);
-	if (!info) {
-		dev_err(dev->gdev, "framebuffer_alloc failed\n");
+	if (!info)
 		goto e_nomem;
-	}
 
 	dev->info = info;
 	info->par = dev;
Index: b/drivers/video/fbdev/ssd1307fb.c
===================================================================
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -556,10 +556,8 @@ static int ssd1307fb_probe(struct i2c_cl
 	}
 
 	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
-	if (!info) {
-		dev_err(&client->dev, "Couldn't allocate framebuffer.\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	par->info = info;
Index: b/drivers/video/fbdev/sunxvr1000.c
===================================================================
--- a/drivers/video/fbdev/sunxvr1000.c
+++ b/drivers/video/fbdev/sunxvr1000.c
@@ -121,7 +121,6 @@ static int gfb_probe(struct platform_dev
 
 	info = framebuffer_alloc(sizeof(struct gfb_info), &op->dev);
 	if (!info) {
-		printk(KERN_ERR "gfb: Cannot allocate fb_info\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
Index: b/drivers/video/fbdev/sunxvr2500.c
===================================================================
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -132,7 +132,6 @@ static int s3d_pci_register(struct pci_d
 
 	info = framebuffer_alloc(sizeof(struct s3d_info), &pdev->dev);
 	if (!info) {
-		printk(KERN_ERR "s3d: Cannot allocate fb_info\n");
 		err = -ENOMEM;
 		goto err_disable;
 	}
Index: b/drivers/video/fbdev/sunxvr500.c
===================================================================
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -272,7 +272,6 @@ static int e3d_pci_register(struct pci_d
 
 	info = framebuffer_alloc(sizeof(struct e3d_info), &pdev->dev);
 	if (!info) {
-		printk(KERN_ERR "e3d: Cannot allocate fb_info\n");
 		err = -ENOMEM;
 		goto err_disable;
 	}
Index: b/drivers/video/fbdev/tgafb.c
===================================================================
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -1416,10 +1416,8 @@ static int tgafb_register(struct device
 
 	/* Allocate the fb and par structures.  */
 	info = framebuffer_alloc(sizeof(struct tga_par), dev);
-	if (!info) {
-		printk(KERN_ERR "tgafb: Cannot allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	dev_set_drvdata(dev, info);
Index: b/drivers/video/fbdev/udlfb.c
===================================================================
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1689,10 +1689,8 @@ static int dlfb_usb_probe(struct usb_int
 
 	/* allocates framebuffer driver structure, not framebuffer memory */
 	info = framebuffer_alloc(0, &dlfb->udev->dev);
-	if (!info) {
-		dev_err(&dlfb->udev->dev, "framebuffer_alloc failed\n");
+	if (!info)
 		goto error;
-	}
 
 	dlfb->info = info;
 	info->par = dlfb;
Index: b/drivers/video/fbdev/via/viafbdev.c
===================================================================
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -1756,10 +1756,8 @@ int via_fb_pci_probe(struct viafb_dev *v
 	viafbinfo = framebuffer_alloc(viafb_par_length +
 		ALIGN(sizeof(struct viafb_shared), BITS_PER_LONG/8),
 		&vdev->pdev->dev);
-	if (!viafbinfo) {
-		printk(KERN_ERR"Could not allocate memory for viafb_info.\n");
+	if (!viafbinfo)
 		return -ENOMEM;
-	}
 
 	viaparinfo = (struct viafb_par *)viafbinfo->par;
 	viaparinfo->shared = viafbinfo->par + viafb_par_length;
@@ -1834,8 +1832,6 @@ int via_fb_pci_probe(struct viafb_dev *v
 		viafbinfo1 = framebuffer_alloc(viafb_par_length,
 				&vdev->pdev->dev);
 		if (!viafbinfo1) {
-			printk(KERN_ERR
-			"allocate the second framebuffer struct error\n");
 			rc = -ENOMEM;
 			goto out_fb_release;
 		}
Index: b/drivers/video/fbdev/vt8623fb.c
===================================================================
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -669,10 +669,8 @@ static int vt8623_pci_probe(struct pci_d
 
 	/* Allocate and fill driver data structure */
 	info = framebuffer_alloc(sizeof(struct vt8623fb_info), &(dev->dev));
-	if (! info) {
-		dev_err(&(dev->dev), "cannot allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	par = info->par;
 	mutex_init(&par->open_lock);
