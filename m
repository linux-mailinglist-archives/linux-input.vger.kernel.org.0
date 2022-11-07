Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7AD61F002
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 11:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbiKGKL2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 05:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbiKGKLO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 05:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E212D12
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 02:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667815820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=VrtSGzs6KIPr9uzMHcL16iDM7kdFVmPcu2NVjsMq2pc=;
        b=HU54Vez2e5i5kgjhkI2L4HOuHYQimuXhEUYOZ1xssnUukiDjjK43pCNf5LjJFkUYuxC9ED
        RHBnjvgU87m4WhMiR7vZ0U9tcADH8RFi5qP8VljKhQi6GoB2Zdqn7iuQYWQyj/QVk5oTqw
        q+QASBQ3VDCilFag/XortfSdRuhROxk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-UD5jN9mSPlWFkWDpyN_pMA-1; Mon, 07 Nov 2022 05:10:19 -0500
X-MC-Unique: UD5jN9mSPlWFkWDpyN_pMA-1
Received: by mail-ed1-f72.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso8077356edc.21
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 02:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VrtSGzs6KIPr9uzMHcL16iDM7kdFVmPcu2NVjsMq2pc=;
        b=lza69qQGwV+02uFERxdh/vUiYkus0y/p6EKW45XLA27fLp9zL2XCHTE75VgHJ7cf2g
         Tz4g4GXnKoji2KkHy/M490VMnliijQ32cyWWJQRx4h4nBhMHaMYES4w80UXJfVS5ywCp
         cRM035LloaFE10PpAy1QK1HL5WtpRRlFn7bHwGBAONHsaYg6xfG9Onu11WExMJCcOqWs
         IN55tFmpq6HmIG25ywnOBfM5eiU00KTangCKPSWoipI7ruPRGYpPviZ5C/yViZlCmfQV
         piCJZyMvRRXqE8hyCxa/6t16c6Xu2HUSgtVzCi9PjZSQ4stQjByzXqwlnLuP0OTuGh/r
         cqkQ==
X-Gm-Message-State: ACrzQf1nqKlw1MgB1RubuXPONhn1uGkO/ILuePXQIakx9lGubnuMS6bZ
        kBBJmJgJcYx1BSVGsgVMRmHII+90hC0DjgWv3MALIBazIdWDnUarWmSaQBOsNcsOBFilJYHRsQu
        +qU3s5PBkIFyLJ5dFrDmRehs=
X-Received: by 2002:a17:906:1c0e:b0:7ad:c648:a4af with SMTP id k14-20020a1709061c0e00b007adc648a4afmr42296758ejg.277.1667815817910;
        Mon, 07 Nov 2022 02:10:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM49yD5grGzJV3/R4j3otuN2m9CrC0LxSWMHIqb5jc0DYQHNvImuX3u6tT6W9Bf/TSAEznEBUw==
X-Received: by 2002:a17:906:1c0e:b0:7ad:c648:a4af with SMTP id k14-20020a1709061c0e00b007adc648a4afmr42296743ejg.277.1667815817718;
        Mon, 07 Nov 2022 02:10:17 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k14-20020a056402048e00b00456c6b4b777sm3936300edv.69.2022.11.07.02.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:10:17 -0800 (PST)
Message-ID: <ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com>
Date:   Mon, 7 Nov 2022 11:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To:     Benjamin Tissoires <btissoir@redhat.com>,
        linux-input <linux-input@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Detecting if a laptop is using a i2c/smbus or a ps/2 attached
 touchpad?
Cc:     Manyi Li <limanyi@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin, et. al.,

I have just merged a patch which adds a couple of DMI quirks to disable
the touchpad on/off functionality of the ideapad-laptop module on some models,
because it is causing issues there.

Patch:      https://lore.kernel.org/platform-driver-x86/20221018095323.14591-1-limanyi@uniontech.com/
Discussion: https://lore.kernel.org/platform-driver-x86/fdceb6d2-c38c-e8ff-4c19-b01521ca46c0@redhat.com/

Rather then using DMI quirks I would prefer to just disable it everywhere
where a i2c-attached touchpad is used. Be it either one only attached to
i2c, or one of the synaptics intertouch thingies. I'm still trying to
figure out why the ideapad-laptop module's touchpad control (which
uses the EC + enabling/disabling the i8042 aux-port) matters for
i2c-attached touchpads at all, so I suspect that intertouch might be
a part of it.

So now I'm wondering if there is some nice way for the ideapad-laptop
code to check if the touchpad is intertouch and/or if it is i2c-attached
only ...

Any ideas?

Regards,

Hans

p.s.

Is it possible that Elan touchpads use something similar to intertouch,
or is that a synaptics thing only (under Linux)  ?

