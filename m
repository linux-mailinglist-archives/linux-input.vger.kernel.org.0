Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99384599D64
	for <lists+linux-input@lfdr.de>; Fri, 19 Aug 2022 16:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349233AbiHSOPn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Aug 2022 10:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348475AbiHSOPm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Aug 2022 10:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A4A96FFC
        for <linux-input@vger.kernel.org>; Fri, 19 Aug 2022 07:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660918539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g7OyeVLAU6xMi038SjWDHGxYcHH7a4vEJga0kvvd3tQ=;
        b=RxSu3mTJqFabJf/eAqdSrTkzWjX5x36YeSiToUGjzzwioMXDXL2YBdcIgjXcQnBIJmGnww
        IBSzRowVXK/a62GptR7qvbFyRl271K1hJwEzJINf1bf7pGPRqsAjnJTDxQA5/Wp/4CnE63
        0ZuZTkhMqq8vzJht11XEes3VaA2AA7M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-xYbOggDXNFSahPyPNI6r5A-1; Fri, 19 Aug 2022 10:15:38 -0400
X-MC-Unique: xYbOggDXNFSahPyPNI6r5A-1
Received: by mail-wr1-f71.google.com with SMTP id r8-20020adfbb08000000b00225239ce4deso803003wrg.1
        for <linux-input@vger.kernel.org>; Fri, 19 Aug 2022 07:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g7OyeVLAU6xMi038SjWDHGxYcHH7a4vEJga0kvvd3tQ=;
        b=nV2S6eUmdIt/c5buB63wlvSmhvRBITsIKLVeTueW/yqYtkKuHLpQ0YY42tFXnMOIa6
         LH4rjfHHABlLHGElSeRE8jnwggiAiYdZM1dmKXJeuHVwt020cosPUV/uIMckxfMlxuk0
         kPL9cVi4h9xPCYIu/dbNDGl5lssWNfxmBiemaTXD7oo+4KE8DdI5igXX01OUz4svwfJx
         YmWqMZpaWsEe5VCV/Vm3w8UdbeX6MYO5FHeRzUCNNndT49Bgebb6ylV0fSWNqIoeABNJ
         7H0nKZja/3d7Scxy7VEvDbkYSKWRg++eDqsZyO86q08ec+3bmikli5zMuwGJcXmJb0+E
         uxAA==
X-Gm-Message-State: ACgBeo2PbLgD1Yoc9/9QR/H3HIvAUeK0fo04kSjH9nD+wQn1ydK4t8wk
        y63P3vVlDBTeQILlOlD49etmzdzUx26nOWtUih/q1IYMriZmWeOc1vE4LdzkiOt5/mq3g0/h4jn
        OcXYYqs6XDhsADKW4ABZF2bI=
X-Received: by 2002:a05:6000:693:b0:221:7a12:8d6a with SMTP id bo19-20020a056000069300b002217a128d6amr4452025wrb.290.1660918536551;
        Fri, 19 Aug 2022 07:15:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kv2X5n6PMQW+2A4jNkYIUZt3CTpd8SxcHtLlp9NnUTjeX5pz4XSu0OLyUbXN7khaDmnjbng==
X-Received: by 2002:a05:6000:693:b0:221:7a12:8d6a with SMTP id bo19-20020a056000069300b002217a128d6amr4452013wrb.290.1660918536293;
        Fri, 19 Aug 2022 07:15:36 -0700 (PDT)
Received: from [192.168.110.200] (82-65-22-26.subs.proxad.net. [82.65.22.26])
        by smtp.gmail.com with ESMTPSA id m6-20020a056000008600b0021d6dad334bsm4242706wrx.4.2022.08.19.07.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:15:35 -0700 (PDT)
Message-ID: <d8b91029-4a6e-1508-1512-faea768ae580@redhat.com>
Date:   Fri, 19 Aug 2022 16:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: PROBLEM: Regression likely in hid_uclogic driver breaks Huion
 Inspiroy H640 drawing tablet
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Stefan Hansson <newbie13xd@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <ping.cheng@wacom.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <9e16d503-2203-57ed-d6af-61fea0c3e10b@gmail.com>
 <nycvar.YFH.7.76.2207231339500.19850@cbobk.fhfr.pm>
 <20220724114849.GA32182@elementary> <20220725224841.GA75640@elementary>
 <3f2e0a49-38a8-417e-1bb0-9a9f28371240@gmail.com>
 <20220804182445.GA16569@elementary>
 <CAO-hwJ+hBipNJpeYaHRr2-rKXA5d79XT7zE2fo2oEKUKJtKJ0g@mail.gmail.com>
 <20220813110922.GA47526@elementary>
Content-Language: en-US
In-Reply-To: <20220813110922.GA47526@elementary>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Sat, Aug 13, 2022 at 1:09 PM José Expósito <jose.exposito89@gmail.com> wrote:
>
> Hi Benjamin,
>
> On Thu, Aug 11, 2022 at 05:23:52PM +0200, Benjamin Tissoires wrote:
> > On Thu, Aug 4, 2022 at 8:24 PM José Expósito <jose.exposito89@gmail.com> wrote:
> > >
> > > Hi again,
> > >
> > > On 2022-07-26 18:48, José Expósito wrote:
> > > > The first bad commit is 87562fcd1342 ("HID: input: remove the need for
> > > > HID_QUIRK_INVERT"):
> > > > https://lore.kernel.org/all/20220203143226.4023622-11-benjamin.tissoires@redhat.com/
> > > > (CCing the folks whose email is in the patch tags)
> > > >
> > > > I reverted the patch on hid/for-next and, after fixing a tiny conflict,
> > > > I can confirm that the tablet works again as expected.
> > > >
> > > > I'd need to investigate a bit more over the weekend, but I think that
> > > > all HUION tablets with the latest firmware (internally, v2) are
> > > > affected.
> > >
> > > Indeed, it looks like v2 devices are affected. Similar reports:
> > >
> > >  - https://github.com/DIGImend/digimend-kernel-drivers/issues/626
> > >  - https://bugzilla.kernel.org/show_bug.cgi?id=216106
> > >
> > > Kindly sending this thread back to your inbox to see if we could fix
> > > this regression.
> >
> > [sorry, I was out on vacation the past 2 weeks and this week was the
> > usual "urgent" thing I have to day for yesterday]
>
> No problem, I hope you enjoyed your holidays :D
>
> > Ideally, I'd like to not revert that commit. It solves a bunch of
> > issues on many devices, so that's maybe not the way forward.
> >
> > FWIW, it was quite painful to tweak and that was a solution that
> > matches the hid-multitouch devices I could find.
> >
> > I tried to process your email when you described the succession of
> > events without much success.
> >
> > Would you mind dumping a hid-record when exposing the bug?
>
> Sure, I added as an attachment in the existing report in bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=216106#c2
>
> I hope it helps you to debug the issue. Let me know if you need more
> recordings, help testing patches or any other information.
>
> In future changes to tablet code, feel free to cc me. I have a bunch of
> non Wacom devices and I'll help you testing your changes.

FWIW, I found the issue: the hid-uclogic driver is emitting input data
behind hid-input, and the state between the 2 is desynchronized.

The following patch seems to be working (with the Huion v1 protocol I
have here that I have tweaked to resemble a v2):
---
 From aeedd318e6cb4dbee551f67616302cc7c4308c58 Mon Sep 17 00:00:00 2001
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 18 Aug 2022 15:09:25 +0200
Subject: [PATCH] Fix uclogic

---
  drivers/hid/hid-input.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c6b27aab9041..a3e2397bb3a7 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1530,7 +1530,10 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
  			 * assume ours
  			 */
  			if (!report->tool)
-				hid_report_set_tool(report, input, usage->code);
+				report->tool = usage->code;
+
+			/* drivers may have changed the value behind our back, resend it */
+			hid_report_set_tool(report, input, report->tool);
  		} else {
  			hid_report_release_tool(report, input, usage->code);
  		}
-- 
2.36.1

---

Can someone with an affected device test it?

Cheers,
Benjamin

>
> Best wishes,
> Jose
>
> > Cheers,
> > Benjamin
> >
> >
> > >
> > > Best wishes,
> > > Jose
> > >
> > > > Those tablets do not set the inrange bit (UCLOGIC_PARAMS_PEN_INRANGE_NONE).
> > > > The driver sets it and uses a timer to remove it.
> > > > See drivers/hid/hid-uclogic-core.c, function uclogic_raw_event_pen().
> > > > [...]
> > >
> >
>

