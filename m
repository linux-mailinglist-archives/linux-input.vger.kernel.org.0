Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE94427CBA
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 20:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhJISmz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 14:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhJISmz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Oct 2021 14:42:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3671C061570
        for <linux-input@vger.kernel.org>; Sat,  9 Oct 2021 11:40:57 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r7so40523999wrc.10
        for <linux-input@vger.kernel.org>; Sat, 09 Oct 2021 11:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X/8ozOEz9M/VZ/CZof3sV9avvfgPhCapkPPuRXd+j7o=;
        b=ZR+gOIu3qE2IxyfJV3Y+LrV/K1+UjpNfaAJGCuVSZrrSGfHJeUvzixCo6miR63l704
         f8Fy+TkBB7Vjvs/h3Xpjmj2o2xSZ90UNVE0cSQtYUkwrHIgHbMvT3Up7PC+b7R3rlEyj
         BIwv6VpFBe9j88JFWduMlv0pXotS0zqTYHF6MbgGvVYSu07/gg67ts+lRP+qKVkoUEOs
         dv4hjrIi2baGI9zw2pCzBHAr7U3zo0DPKtrnVze4wAw9N/WZG7XO5fp6EfSqoPpxK56M
         Iq1Cex5jTm472fnNrZV2N3HyiM5Cek8ULZxkFtHYnDWQ23Jj4w8Nse/Aet1o/0NF3gqs
         Kr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X/8ozOEz9M/VZ/CZof3sV9avvfgPhCapkPPuRXd+j7o=;
        b=PCwaIc2PSqgillgKx1MOOPKQJAhhtQCyOPowS/TYZUqFrxXDyLayAPqTzpXpGqvQsS
         MBUDK/iTXj2K4CKKbptE6qvN0MqnJl/IP9v2DrmbgmDkhKg3x6GJSyXj78bUWDdG0g3a
         qiBqsaq/qfL9ae1Hc6wyOaoeAGi4Rwodzp7saxG060PlZ+ogcN/dN3nOXKwirEs6RtNW
         ZGO0+bH1HQC5+lJYhnTwDH4A/byCFAskZ5B1LROb4AIyL9qXW/mwien4RcTm7nnHw2Bf
         q66e9p3Y3PJJ1QXL81KueDnBJ1gr3vVzzUZhGGhFEvVOhSxDKISt6aFnfloBW5tHbs8F
         C0Kg==
X-Gm-Message-State: AOAM530xVieXRm+Z4eRKTEhc8V134Dhv91IstsCW0Ip8qVkrHkGYmsxl
        QSUMU2O5LxF2lAtwnZpxbn0=
X-Google-Smtp-Source: ABdhPJwzw5QNboXzZGjQThcDJgATsxaDAhlgKnrxZWb/KR8nw3jSchMMrAfZQLDfvzMcvnxVd51/1A==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr12675981wrg.339.1633804856509;
        Sat, 09 Oct 2021 11:40:56 -0700 (PDT)
Received: from elementary ([94.73.34.90])
        by smtp.gmail.com with ESMTPSA id h22sm3041228wmq.42.2021.10.09.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 11:40:55 -0700 (PDT)
Date:   Sat, 9 Oct 2021 20:40:51 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Alex Henrie <alexhenrie24@gmail.com>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jikos@kernel.org, jslaby@suse.cz, juw@posteo.de,
        lukas@wunner.de
Subject: Re: [PATCH 3/3] HID: apple: Bring back flag for Apple tilde key quirk
Message-ID: <20211009184051.GA72740@elementary>
References: <20211008073702.5761-1-alexhenrie24@gmail.com>
 <20211008073702.5761-3-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008073702.5761-3-alexhenrie24@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alex,

Thank you very much for cc'ing me.

On Fri, Oct 08, 2021 at 01:37:02AM -0600, Alex Henrie wrote:
> Some Apple ISO keyboards have a quirk where the backtick/tilde key is
> swapped with the less-than/greater-than key. Unfortunately, there is no
> perfectly reliable way to detect whether a keyboard has the quirk or
> not, but the quirk appears to only be present on models that support
> Bluetooth, and the affected keyboards usually report country code 13 in
> the HID descriptor.
> 
> Therefore, the best we can do is to change
> /sys/module/hid_apple/parameters/iso_layout to a ternary:
> 
> 0 = Not ISO or ISO and not quirky
> 1 = ISO and quirky
> -1 = Guess based on product ID and country code
> 
> Table of keyboards I have tested:
> 
> Product    Model  Shape  Labels      Bus  Country  Quirky
> =========================================================
> 05ac:0201  M2452  ANSI   Usonian     USB  0        No
> 05ac:020b  A1048  ANSI   Usonian     USB  0        No
> 05ac:020c  A1048  ISO    Québécois   USB  13       No
> 05ac:0221  A1243  ISO    Norwegian   USB  13       No
> 05ac:0221  A1243  ISO    Portuguese  USB  13       No
> 05ac:0221  A1243  ISO    Swedish     USB  13       No
> 05ac:0221  A1243  ISO    Swiss       USB  13       No
> 05ac:022c  A1255  ANSI   Usonian     BT   33       No
> 05ac:022d  A1255  ISO    Hebrew      BT   13       Yes
> 05ac:022d  A1255  ISO    Québécois   BT   13       Yes
> 05ac:022d  A1255  ISO    Spanish     BT   13       Yes
> 05ac:023a  A1314  ISO    Russian     BT   13       Yes
> 05ac:023a  A1314  ISO    Swiss       BT   13       Yes
> 05ac:024f  A1243  ANSI   Usonian     USB  0        No
> 05ac:0250  A1243  ISO    British     USB  13       No
> 05ac:0250  A1243  ISO    German      USB  13       No
> 05ac:0250  A1243  ISO    Italian     USB  13       No
> 05ac:0250  A1243  ISO    Québécois   USB  13       No
> 05ac:0251  A1243  JIS    Japanese    USB  15       No
> 05ac:0255  A1314  ANSI   Usonian     BT   33       No
> 05ac:0255  A1314  ANSI   Taiwanese   BT   33       No
> 05ac:0255  A1314  ANSI   Thai        BT   33       No
> 05ac:0256  A1314  ISO    Arabic      BT   13       Yes
> 05ac:0256  A1314  ISO    French      BT   13       Yes
> 05ac:0256  A1314  ISO    German      BT   13       Yes
> 05ac:0256  A1314  ISO    Norwegian   BT   13       Yes
> 05ac:0256  A1314  ISO    Spanish     BT   13       Yes
> 05ac:0256  A1314  ISO    Swiss       BT   13       Yes
> 05ac:0257  A1314  JIS    Japanese    BT   15       No
> 05ac:0267  A1644  ANSI   Usonian     USB  33       No
> 004c:0267  A1644  ANSI   Usonian     BT   0        No
> 05ac:0267  A1644  ISO    British     USB  13       Yes
> 004c:0267  A1644  ISO    British     BT   0        Yes
> 05ac:0267  A1644  ISO    Swiss       USB  13       Yes
> 004c:0267  A1644  ISO    Swiss       BT   0        Yes
> 05ac:0267  A1644  ISO    Québécois   USB  13       Yes
> 004c:0267  A1644  ISO    Québécois   BT   0        Yes
> 05ac:0267  A1644  JIS    Japanese    USB  15       No
> 004c:0267  A1644  JIS    Japanese    BT   0        No
> 05ac:029c  A2450  ANSI   Usonian     USB  33       No
> 004c:029c  A2450  ANSI   Usonian     BT   0        No
> 05ac:029c  A2450  ISO    Spanish     USB  13       Yes
> 004c:029c  A2450  ISO    Spanish     BT   0        Yes
> 05ac:029c  A2450  JIS    Japanese    USB  15       No
> 004c:029c  A2450  JIS    Japanese    BT   0        No

You can add to the table:

05ac:0267  A1644  ISO    Spanish     USB  13       Yes
004c:0267  A1644  ISO    Spanish     BT   0        Yes

Tested here and it works as expected, both over USB and bluetooth,
thank you very much for fixing it!

It's a pitty that we need to add a configuration option, for many users
it is not going to be easy to discover it.

macOS doesn't have this issue, so there must be a way of detecting the keyboard
layout... Unless they apply the quirk on user space checking the selected
keyboard layout and language in settings.
I bought ANSI English keyboard to see if I could figure out where is the
difference but no luck so far.

For what it's worth, Tested-by: José Expósito <jose.exposito89@gmail.com>
