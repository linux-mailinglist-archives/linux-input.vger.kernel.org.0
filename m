Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED7F1ABFD3
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 13:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505833AbgDPLlK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 07:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505667AbgDPK6U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 06:58:20 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9C8C02C444;
        Thu, 16 Apr 2020 03:57:21 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a81so4313390wmf.5;
        Thu, 16 Apr 2020 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1R+POzDb07QCuzG8dygmIi1RHIR7DIkd1sxfGgpHkcM=;
        b=tudGTyZ+6A0/a3xr1gos5qcfxOw9o6PF/GllYmJ+A2LP2tj1EsjrygisBwOSQioQBM
         DFTYxa6VmeG260A9c0jRGSs+qxc+FfVNExy40M0OWHE6vj0dpJiKtxVrCtjcOCYKP4QQ
         EltaT8KWSNvrDnD1rIFhPSrPeF/geIgYoRd/D27UENo3kf4NhknOHusR/GWaCZnVsRY+
         v1ZKOwoGPYv/B7gjGZJsaKi+iLGKQ2csheq8nRCU5cc0ubKRxpbKtDR4KryODgQQ2xI5
         MUKvQ5MSMH5e56jkBvHHNuDAQTkMaofZagVR0ZtJuxeFlYQhjrrnKzsP/CQ8nf8hMy3n
         Jzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1R+POzDb07QCuzG8dygmIi1RHIR7DIkd1sxfGgpHkcM=;
        b=OodDxfJwglJDatEZw3XulO4kZcwoRGu3RodtcCKVVyVjK9qv+nNgB69SPQGhQHTpGj
         uUDD8tXUzgLwimz9r4zLT1gdQhkg5Qo2x5yDFdRUtqNJVM3GTJkCIn+xLIgUQBdP3Os5
         Q+M3ENYSrTCuufe1lk3Fj0lcdtogrtcI8i+IZGP8VbyFBVbLtH6vg442qvaYYDUJuZ4h
         VSTIELCWcNhJ8+sDetiuaPtlIobmOrm6PNADzCx9SxFjRdFnMsP18oENuXvwuc39afk8
         +WrHhrdklujoNHXIMUby7BdViEwaj4QpINAZKYMRQaCVwwOdEytMjlwG+4pPxFmHP5U1
         PBhQ==
X-Gm-Message-State: AGi0PuaFJ0O9eJQKeTP5+yXNOJNPgPzr+NnCzoMirHbOd1pyr/hgdZeg
        fjQmRLEgliNJP8SHiQLPA844Gu3sMxA5WAVhRJs=
X-Google-Smtp-Source: APiQypJLarDf4u8sYmfZ2Gx2IfEXK9AMJIseyZedhiY2fzgofnoqNcFA0FU9PoNH4Ui4bnCDsjpUw9jCPPQ8cD9pgAo=
X-Received: by 2002:a7b:c456:: with SMTP id l22mr4155568wmi.148.1587034639618;
 Thu, 16 Apr 2020 03:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com> <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C2FB967974B98B224610C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <TYAPR01MB387100BC93864B0A93598BFBECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C914C96A8DCC47925502C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxLXT2fMdhmnfj3ZH2Ptc50nvMVU0nAvW-3fw-wAKb9rYQ@mail.gmail.com>
 <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxKfJBWb45PuA-1t=-ZysyUVZZmXJH=D2bSacoh2akJ0Zw@mail.gmail.com>
 <OSAPR01MB30571BF938FF882F7FB22853C8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxJK3=Ytna5WuMOWc=nNJ3ZvwSJRx4-epoktw_vULBm0Tw@mail.gmail.com> <TYAPR01MB3072BBC14F0F73BD0FCB3130C8D80@TYAPR01MB3072.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB3072BBC14F0F73BD0FCB3130C8D80@TYAPR01MB3072.jpnprd01.prod.outlook.com>
From:   Artem Borisov <dedsa2002@gmail.com>
Date:   Thu, 16 Apr 2020 14:57:08 +0400
Message-ID: <CAMr=fxJ17OO_R7Z4HoLAg=kJJcskN2otnz4-E_6uFjKYV8+_tQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
To:     Xiaojian Cao <xiaojian.cao@cn.alps.com>
Cc:     Masaki Ota <masaki.ota@alpsalpine.com>, jikos@kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tetsuya Nomura <tetsuya.nomura@alpsalpine.com>,
        "vadim@cirque.com" <vadim@cirque.com>,
        "pod.alcht@cn.alps.com" <pod.alcht@cn.alps.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi.

Right now I'm employed as a mobile OS engineer, if that matters.
