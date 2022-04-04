Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D034F1D53
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 23:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380398AbiDDVat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Apr 2022 17:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380530AbiDDUYA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Apr 2022 16:24:00 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF6436B60
        for <linux-input@vger.kernel.org>; Mon,  4 Apr 2022 13:22:00 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 17so14499735lji.1
        for <linux-input@vger.kernel.org>; Mon, 04 Apr 2022 13:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=lr5sKsDDbHLhXagaz8kUbbDDs1yJiMgTHVATdTAVDBM=;
        b=wf2S/h8HwirRE12vevP24/+KEQYQ91PBw8HihDK6TGYEs3PyjOkoQ0t7hYHGePlbXg
         qYcmoF9lR47AmP4Dx3oOuAdeJHAVJuLKhb8kYZNSmlqxRNgT4z3Ahy2mRaXFmf9nj+4M
         JXTvNRNP5l4a6G4cV3VD6V40QFSGa7CwEtSowq5lXi6jtDeyKvQW8Dw0bwlv+L37WRve
         agu+aPpiKfwcw0PDPLBOuwXpohY/oLDUTZ6R9QNZiZObVLfeEYEzLjXLLgpAufyKlEzh
         9C3QsVxatejd6urAtAdF7Q9plcmHmnbAZcUUtFffuK4FvTDu2nfHZQc8KB5I5+UfC4+t
         dT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=lr5sKsDDbHLhXagaz8kUbbDDs1yJiMgTHVATdTAVDBM=;
        b=Cy1YanoaS95tOXaCiFcY4Ft8icoOzRgkbC/r1D/u+qlzCFDrxIXq+4dr5WzsdPzKQa
         KAbM7WNuYkQblmdZfCXXdmFIyc4xj7ScS7hXnZokFAQXEQYTzlld50OouLmla5avGqXh
         Jpu/mEDhNdcEhwcr6p76hg7YJ4ujQ2sk/aVIdUodAtkk+m3uGAyy8pA9DHfJrq2ZabJi
         R4KogWmFxieQZdKaF8yKrw/mZFeQTw3a/NESpGLD7UUeiCvdA8y3aaYAQtUiwXII35+Z
         CPtZwm67/ut4J/HmWbCofUMwFL5M1kFiLmq2edzJqFGJAJkIn7LG/eRE4FktF4WEyw55
         fk2A==
X-Gm-Message-State: AOAM5306rFl4olKKKfYRZLyIDmL9Of/JwshzA+d3sn2ICoNPu+Gx/I+v
        c8Ee+YLPyTScs1zVPxpXhi3PjwsDgRxYmG8G
X-Google-Smtp-Source: ABdhPJwdqbcSaool2vcLZl1OTCfUPbPDupu3l78FZbhAgRR7KLShs7DCjwfJb4DQwNwjuNKRk9L4Ew==
X-Received: by 2002:a2e:a90c:0:b0:24a:fe8f:595c with SMTP id j12-20020a2ea90c000000b0024afe8f595cmr798766ljq.423.1649103718085;
        Mon, 04 Apr 2022 13:21:58 -0700 (PDT)
Received: from [192.168.0.199] (89-71-80-219.dynamic.chello.pl. [89.71.80.219])
        by smtp.gmail.com with ESMTPSA id bi2-20020a0565120e8200b004484aaaf818sm1250724lfb.13.2022.04.04.13.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 13:21:57 -0700 (PDT)
Message-ID: <7b345a16-60bd-001f-edec-724ca2b3c47a@semihalf.com>
Date:   Mon, 4 Apr 2022 22:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mm@semihalf.com
From:   =?UTF-8?Q?Marek_Ma=c5=9blanka?= <mm@semihalf.com>
Subject: [PATCH] HID: multitouch: Add support for Google Whiskers Touchpad
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
  drivers/hid/hid-multitouch.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99eabfb4145b..bda79197273b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] = {
  	{ .driver_data = MT_CLS_GOOGLE,
  		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
  			USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
+	{ .driver_data = MT_CLS_GOOGLE,
+		HID_USB_DEVICE(USB_VENDOR_ID_GOOGLE,
+			USB_DEVICE_ID_GOOGLE_WHISKERS) },

  	/* Generic MT device */
  	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, 
HID_ANY_ID) },
-- 
2.32.0

