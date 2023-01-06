Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA0266029F
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 15:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbjAFOyf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Jan 2023 09:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjAFOyO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Jan 2023 09:54:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDC780AEF
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 06:54:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5DFF4B81D59
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 14:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD01C433EF;
        Fri,  6 Jan 2023 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673016850;
        bh=Bh/rtBzCiusDBf9Bq/dcn2ily/fKp9K2HGpCyiD8h9w=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LKM9BLtkQBCMxjhxodQDFUS4iIHuQ3uOLZe83gVo5WjJUPCJ2obdRROECSMNhHK0M
         Q9yFWTQoxlUyCUFLucdIQ1PU2zzuqZ0vWbTpVT5DoysnCX26hB8CFkdbTSKEzL1H6y
         eLhuUx1vy0YM8xYsatPlllkPudLbbNZHbu93fvqtTved+gNg4+v2yYLDNIAqT1bOup
         zqs9foiafmOhf5wm86pKsrCi3YaIIUfgpLd7DTHCNxfZWnWNq38c0DNe8yTbfnkdoC
         FLiPIQi2B8F6Ad2OYfYbr1SWe9k3ktXz2CmJKcBYIg3WEDDzZZerL6XEeJD8vej/OA
         b5+RsMrJJOifw==
Date:   Fri, 6 Jan 2023 15:54:10 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Philipp Jungkamp <p.jungkamp@gmx.net>
cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [hid:for-6.3/hid-sensor 2/4] drivers/hid/hid-sensor-custom.c:960:12:
 warning: stack frame size (1104) exceeds limit (1024) in
 'hid_sensor_custom_probe'
In-Reply-To: <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
Message-ID: <nycvar.YFH.7.76.2301061553290.1734@cbobk.fhfr.pm>
References: <202212230026.gBHQvZbI-lkp@intel.com> <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 22 Dec 2022, Philipp Jungkamp wrote:

> Hello,
> 
> does this mean the problem lies in 'hid_sensor_custom_probe' itself or
> could this also be caused by local variables in nested functions.
> 
> I suspect the problem lies in 'hid_sensor_custom_get_known' where I put
> an instance of 'struct hid_sensor_custom_properties' on the stack.
> 
> This struct is way too large (I didn't know there was a upper stack
> limit of 1024). It's current size is sizeof(u16) * 3 *
> HID_CUSTOM_MAX_FEATURE_BYTES = 384.
> 
> Would allocating it for the scope of 'hid_sensor_custom_get_known' make
> sense?
> 
> Which kind of kernel allocation functions should I use here?  

As there was no followup to this as far as I can see, I have just queued 
the patch below on top of the hid-sensor branch.



From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: hid-sensor-custom: Fix big on-stack allocation in hid_sensor_custom_get_known()

struct hid_sensor_custom_properties is currently 384 bytes big, which consumes
too much stack space for no good reason. Make it dynamically allocated.

Fixes: 98c062e824519 ("HID: hid-sensor-custom: Allow more custom iio sensors")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-sensor-custom.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-sensor-custom.c
index 0c287dde345c..3e3f89e01d81 100644
--- a/drivers/hid/hid-sensor-custom.c
+++ b/drivers/hid/hid-sensor-custom.c
@@ -911,21 +911,28 @@ hid_sensor_custom_get_known(struct hid_sensor_hub_device *hsdev,
 	int ret;
 	const struct hid_sensor_custom_match *match =
 		hid_sensor_custom_known_table;
-	struct hid_sensor_custom_properties prop;
+	struct hid_sensor_custom_properties *prop;
 
-	ret = hid_sensor_custom_properties_get(hsdev, &prop);
+	prop = kmalloc(sizeof(struct hid_sensor_custom_properties), GFP_KERNEL);
+	if (!prop)
+		return -ENOMEM;
+
+	ret = hid_sensor_custom_properties_get(hsdev, prop);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	while (match->tag) {
-		if (hid_sensor_custom_do_match(hsdev, match, &prop)) {
+		if (hid_sensor_custom_do_match(hsdev, match, prop)) {
 			*known = match;
-			return 0;
+			ret = 0;
+			goto out;
 		}
 		match++;
 	}
-
-	return -ENODATA;
+	ret = -ENODATA;
+out:
+	kfree(prop);
+	return ret;
 }
 
 static struct platform_device *

-- 
Jiri Kosina
SUSE Labs

