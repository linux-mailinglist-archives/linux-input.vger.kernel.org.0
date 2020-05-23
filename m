Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26AB81DFA52
	for <lists+linux-input@lfdr.de>; Sat, 23 May 2020 20:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbgEWShk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 May 2020 14:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387551AbgEWShi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 May 2020 14:37:38 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72863C061A0E
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 11:37:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k22so5732926pls.10
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o+A/o/w7dcUzbVwet5bgfzXMbCQ5iqqzEdm35+EtR2s=;
        b=AER9LOVRzwH02BS6davl9ROHC0aJRyOU1+y1JeEkdLzRn0CBVSgDsNRIbTZc3QIjo3
         Y1EyxPBg0q4UyWUgdY/ZP1wRGAArp98IidLyFOj8zdHKrdki7Gux9Wtik9ZAGad5yV4p
         uxOIx4Gr9oqeYt0QAb0xgtssogOI+drqwbRzkvDTJxaQUmZdmhF7mMOEGYpt7ek/7mnP
         In/w3B96HxThg7RybD+V317c4jo8MUtdUL3KOCEVsvkjcupxBqWnpfKbPpXFxHFpTHz1
         oIgIT73g1OYqxnmBaalZ4nLHAnp7T/ALVDIZetE5vlIYciNtY6VAohGZ7AXSyeUUGZ9s
         oX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o+A/o/w7dcUzbVwet5bgfzXMbCQ5iqqzEdm35+EtR2s=;
        b=tzFtNa8UGgvgjiHwyO+KKNFR3EHuqcwrifqhOC1zZ1WyGRiJS1AbdMonkKaTc0T9zA
         coOPMxpFNbKHYu0Wp/GVSG94o0yT6/Ls/r5+f4ftcJYI1+6MUXinKldBOvgA8Ywykw+V
         isXtOiXpi//FrlG9wjnmuYQPk8WvuMWq8vHCpv8m26gpdLVcFSYlpFxLFYGIbraXFWBe
         UsZeCjaI01NWkevIlogIh5zjqB3vnGFGiCX/5Si6CzWzNRjpBCi9ZJOhIWeSVO6XBjXf
         IOZTAYAscFkuSjeFLJmUP6tZHb2cpmWiqVn/YcYe6UfjcN6OFvDSIPwEF58AU13hQ1AN
         Ml5g==
X-Gm-Message-State: AOAM530EkAvgjGkdAV+3p28AG9lB2UJHmr7QlzNPkUDGZcahsEkUx2Mr
        M7PUa0COE9R2krOFwXa92oo=
X-Google-Smtp-Source: ABdhPJzcqK7zn3qFmZZ95S5xcXuARS+6X2U6L9evsBYJfzamIie1c0K8pYV5+HRZsftZ5p+HcTGFbA==
X-Received: by 2002:a17:90a:cd02:: with SMTP id d2mr11722163pju.207.1590259057633;
        Sat, 23 May 2020 11:37:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h7sm8460348pgn.60.2020.05.23.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 11:37:37 -0700 (PDT)
Date:   Sat, 23 May 2020 11:37:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yariv <oigevald+kernel@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery
 (regression)
Message-ID: <20200523183734.GC89269@dtor-ws>
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws>
 <20200512051925.GA48688@koala>
 <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
 <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, May 22, 2020 at 08:27:43AM +0300, Yariv wrote:
> 
> Some things I noticed: Gen2 didn't send "BTN_TOOL_FINGER" events,
> while Gen1 did, even though I did not press any button. Note that Gen1
> still had correct timestamps before the regression, even though it
> sent these events.
> 
> Another difference (maybe it's the same one..): if you take a look at
> the logs from my previous mail, you'll notice that Gen1 Trackpads
> always send both SYN_REPORT (0) as well as SYN_REPORT (1), while 2nd
> Gen Trackpads only sends SYN_REPORT (0).

So it looks like for Gen1 touchpads we set autorepeat, and it is that
autorepeat on BTN_TOOL_FINGER that gives what you consider jitter.

  - evdev:
    - [  0, 293648,   1, 325,       2] # EV_KEY / BTN_TOOL_FINGER           2
    - [  0, 293648,   0,   0,       1] # ------------ SYN_REPORT (1) ---------- +1ms
  - evdev:
    - [  0, 303026,   3,  48,      88] # EV_ABS / ABS_MT_TOUCH_MAJOR       88 (-12)
    - [  0, 303026,   3,  53,    -232] # EV_ABS / ABS_MT_POSITION_X      -232 (-22)
    - [  0, 303026,   3,  54,     291] # EV_ABS / ABS_MT_POSITION_Y       291 (+60)
    - [  0, 303026,   3,   0,    -232] # EV_ABS / ABS_X                  -232 (-22)
    - [  0, 303026,   3,   1,     291] # EV_ABS / ABS_Y                   291 (+60)
    - [  0, 303026,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +10ms

Can you please tell me what drivers are used by the 2 trackpads when they
are connected via Bluetooth? I think we should stop setting autorepeat in
the driver that handles Gen 1.

Also, can you post /proc/bus/input/devices?

Thanks.

-- 
Dmitry
