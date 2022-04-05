Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA994F4844
	for <lists+linux-input@lfdr.de>; Wed,  6 Apr 2022 02:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbiDEV3q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Apr 2022 17:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454460AbiDEP6b (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Apr 2022 11:58:31 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90D3CFB9C
        for <linux-input@vger.kernel.org>; Tue,  5 Apr 2022 08:04:13 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c15so17478201ljr.9
        for <linux-input@vger.kernel.org>; Tue, 05 Apr 2022 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=Tzi9+dC4/s36jS4xpGWk+MJOeAX6ll0D4U0csg+fSOc=;
        b=NEH8KdW1GUxeAwlw+srnZmjGUICgCEdrQ7kJl9uYqnAKnF2SP355jc6G8BiV0Lfw4r
         3gUfinYIPFLRRejBY3vAw99Pt9SJ+dIaESytUPNsfHqLXZ/6v3wmoo8g2R8PQWUcqGY1
         xnuBe6I5bny88lTWYlLKgcy92u3eogLzStQGfFnr4X60H2ml4SkFxPgjEjSyQraJUCxP
         U2kvTKNm/MKArTlRjp28KqWPwgGlmEJS6E7M6VKAnEFpQI6Aq0BMQTZTxgQ7B0xyg1YP
         6xS3vz7i4Jybcdb+cZ74yMP0G8oTMQzF0mCEDfmOzksgKtZcUI0CDPUdK9ed1GsMbVjJ
         7qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=Tzi9+dC4/s36jS4xpGWk+MJOeAX6ll0D4U0csg+fSOc=;
        b=QeWJ2SbZeCM+Q7H4kdnayRWuHWUkMT1EpGpiYOsORX72btC3PPC4fwE32L3chSrLvF
         Le7Iq6H/7THphBRNBpQM3Tnm1fFBi616fFe+2Gyo84HeftSt3rvDxEg5Ows8zI/GJMVP
         Clnx6n2W/j9GA0QUV0Jdu+v3NeVE2ER6UQ2arfkqWqHVKCCOn6MxLRd5SfNmQ1OOGMKD
         FBDzO3tDjb9l1C//dnAV274mzV3r0v/EGoK2KiHWMQNRu8PmJJbyZKWfJ73inx2ZdkE9
         Uq6R99WX9yDlxoVZllul47wL5EJfwUlbrjNBaaAGgvT1xUjb6d0n44LnBsflLlzxU/Ky
         4V+Q==
X-Gm-Message-State: AOAM531unXaDHwF7Dh19twrtYObUblrjI3Y/ySrqQ+PyHnNnTd8xfX4v
        jifBXZSdZW6ZEqD8dFb1ohTA4eD0Nnltt8bx
X-Google-Smtp-Source: ABdhPJzg0FkkC373afQsPUMKgQOIJbLeU9SWY2p8p2mes2o94fhRjgfyjFmt3LfkNluAEuRLd0BhMQ==
X-Received: by 2002:a05:651c:210a:b0:249:b120:7156 with SMTP id a10-20020a05651c210a00b00249b1207156mr2413714ljq.20.1649171049491;
        Tue, 05 Apr 2022 08:04:09 -0700 (PDT)
Received: from [192.168.0.199] (89-71-80-219.dynamic.chello.pl. [89.71.80.219])
        by smtp.gmail.com with ESMTPSA id cf28-20020a056512281c00b0044ac3867ea8sm1527927lfb.287.2022.04.05.08.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 08:04:09 -0700 (PDT)
Message-ID: <17e7b7ad-1a5b-d813-888f-abea0aa099b1@semihalf.com>
Date:   Tue, 5 Apr 2022 17:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mm@semihalf.com
From:   =?UTF-8?Q?Marek_Ma=c5=9blanka?= <mm@semihalf.com>
Subject: [PATCH v2] HID: multitouch: Add support for Google Whiskers Touchpad
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Google Whiskers touchpad does not work properly with the default
multitouch configuration. Instead, use the same configuration as Google
Rose.

Signed-off-by: Marek Maslanka <mm@semihalf.com>
---

Changes in v2:
   - As a HID device group use HID_GROUP_MULTITOUCH_WIN_8.

  drivers/hid/hid-multitouch.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99eabfb4145b..87a92f2654c0 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] = {
  	{ .driver_data = MT_CLS_GOOGLE,
  		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
  			USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
+	{ .driver_data = MT_CLS_GOOGLE,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, USB_VENDOR_ID_GOOGLE,
+			USB_DEVICE_ID_GOOGLE_WHISKERS) },
  
  	/* Generic MT device */
  	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
-- 
2.32.0

