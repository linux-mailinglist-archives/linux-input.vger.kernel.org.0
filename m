Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFF5454E05
	for <lists+linux-input@lfdr.de>; Wed, 17 Nov 2021 20:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhKQTkO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Nov 2021 14:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239638AbhKQTkM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Nov 2021 14:40:12 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C085DC061570
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 11:37:12 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso6635191otr.2
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlKPRUTcJm+bOUCWbAkUY1Qe6bsanAizXJtTl9a9Ch8=;
        b=oCh6mOUdCmKpUE3mzwPRgOo830TBXHM2t5qvaaMsGNG/XjgSdZXCPdY166iX0ccX/X
         DGxiNDQJDeTrfbCcBMe0owj9C/NiBzR9UHv8k6OG1Jne8uIgo/i2K0PwW9QtPQpznIOO
         N88hIazbPsLO6O7LPIxakMuNrN2qsrNLJf8J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlKPRUTcJm+bOUCWbAkUY1Qe6bsanAizXJtTl9a9Ch8=;
        b=kKYpHjr2YfZvJadSEqFiSr1nDKp5UPhPFI7pcBvSO+evUmd1YbDQZI+OmLe+TLr7A9
         3R8eutFcB9JKghYZG/snwkv4Rmn+BCTEoNKfUMNc5KYFvLLnUFj+nZ/QK0BZvdsBK+1/
         EghLL8tVi8I452LlcdPyfZ/ypSoVa+pq5wv+kRhTzJKgpry2tJ8Ow8oXkG0ckfnxYNPw
         WUhInpQmt9+mJ4EpBEjvBvV0Cd6weySh8WFMSYVihQWqa/I+KhqKyZ4KSCQc3gNgTYtR
         f0yk0kAwqXKcjhMuh8JFbbjiaEqfZGyfTs7SCoqHIzFMHZ8sM1h5jZaieceHNrijcZr1
         F49w==
X-Gm-Message-State: AOAM530/wuX8IaqYDorQLQNUrLl/qYJjA9e+jkupBAOf5XqWUDSO7ecJ
        1AsGorGNDL9RDrkTHRmQQkhrLAfB+jFC1Q==
X-Google-Smtp-Source: ABdhPJwXSYAy1mMQVsNwwWl/1vnW7xfeHKslSSwYKkP2h6hSXIECFB31CXfCsfkHbtD/WFuMDQnOiw==
X-Received: by 2002:a05:6830:1688:: with SMTP id k8mr15547945otr.238.1637177831700;
        Wed, 17 Nov 2021 11:37:11 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id e14sm160593oie.7.2021.11.17.11.37.08
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 11:37:09 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso6604592ots.6
        for <linux-input@vger.kernel.org>; Wed, 17 Nov 2021 11:37:08 -0800 (PST)
X-Received: by 2002:a05:6830:20d3:: with SMTP id z19mr15840988otq.3.1637177828401;
 Wed, 17 Nov 2021 11:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20211103234018.4009771-1-briannorris@chromium.org>
 <20211103164002.2.Ie6c485320b35b89fd49e15a73f0a68e3bb49eef9@changeid> <CAKMK7uHGNrgqjQh3DX4gChpNt+xhB_39sVrhdA3BFqnoW-ue2w@mail.gmail.com>
In-Reply-To: <CAKMK7uHGNrgqjQh3DX4gChpNt+xhB_39sVrhdA3BFqnoW-ue2w@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Wed, 17 Nov 2021 11:36:56 -0800
X-Gmail-Original-Message-ID: <CA+ASDXPtWsZRTUmrGQKY2Sc-yaeg=e47QpkYWA=KpN5iYGafjQ@mail.gmail.com>
Message-ID: <CA+ASDXPtWsZRTUmrGQKY2Sc-yaeg=e47QpkYWA=KpN5iYGafjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/self_refresh: Disable self-refresh on input events
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 17, 2021 at 11:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> Can you pls resend with dri-devel on cc? scripts/get_maintainers.pl
> should pick this up, you have all the maintainers but not the list.

Oops, I don't know how that happened. I guess I sometimes have to trim
get_maintainer output, since it likes to hoover up a bunch of
barely-relevant previous committers. I must have been too aggressive.

I'll plan on sending v2 to dri-devel, but let me know (privately if
you'd like) if you'd prefer a pure RESEND of v1.

Brian
