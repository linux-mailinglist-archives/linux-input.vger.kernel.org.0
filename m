Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D7039CB83
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 00:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFEWwa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Jun 2021 18:52:30 -0400
Received: from mail-pj1-f43.google.com ([209.85.216.43]:43891 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEWwa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Jun 2021 18:52:30 -0400
Received: by mail-pj1-f43.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so8055371pja.2
        for <linux-input@vger.kernel.org>; Sat, 05 Jun 2021 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oWrNW0bbbh1b7VcwtwZl41eRjo3MVvVCIltB2GeGWB4=;
        b=I0Mndys2/4luY3BMFmM9qkOamSGNdzaL4yrwWAE4Oa31b6fMwX9mUB4rIN6lxS2kPw
         FGSjI3GIMeGqAXuuOpk0Gy+lw1rKNnIsvHjd1W0Y/FOU5VaK71c1lbG3hD1uJs6TYp1B
         g9sod9iJXVYXyxOOW4VAY8LUXusHRXAZ9C2VPorhSww7yAnwum8K2vOFH4uL8zFLTkqR
         h7LinbWjZ3zv0iol6cSB1uxlk5/fOPwlMXTbz7gTgcNCbTwDCv9uPPBRWVgi/KoHV0J1
         kVi3C3hSevePKFNqJUF+3k3WwCjx9pKrr8TKfNhRXs4oTCBKIrUUmLaVLuLF/HiDC+R/
         Ik2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oWrNW0bbbh1b7VcwtwZl41eRjo3MVvVCIltB2GeGWB4=;
        b=Fc19nAp1hYOgtdQ5TB4WEeSXgHb2ywFzJUoG7qI45sak6t5Or9hyl9AFQHgXK0hMS+
         cZWAdnvpmKx6pqBeepT3UmfoVhDWK6SGznN831vTSrsRh5+MEgqf9kROqYQbcx+Pm9NZ
         8YVs8JqpwYAY+Bc+F82EYUrUJoTplVou5txyIK33xhQvNjLUmSzUyoa/2Br4jEZYiSaC
         9bNp8QdJYZ9/hJL9pRWyp/dOyQHLLpZk2xjVSAbKUjytt/0cjq4bFPbT7fQB3WbBXZZK
         ERpxmIrMDnTP9uRn6phIT1V2DBlyzGKa+gQusFb17wLObSQSqQIzerZiJbS1fKiKyAxf
         xZoA==
X-Gm-Message-State: AOAM532na4RMdK+COQlpikxR6DkRD6DG7aUVxUKeMksdFs8G/qiJm5lz
        4wHwSvbQYcfd7HB76vWrCCCgbBg4BTc=
X-Google-Smtp-Source: ABdhPJx7JdbS72n78HPZUszFMVRCDLhneKwIPbfjsrYJSddRRSfGA8FCtdwH5JcPJzk8s1QMut7Ekg==
X-Received: by 2002:a17:90a:4817:: with SMTP id a23mr24994055pjh.192.1622933366725;
        Sat, 05 Jun 2021 15:49:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5762:ab6a:6802:ef65])
        by smtp.gmail.com with ESMTPSA id 15sm4607605pfv.1.2021.06.05.15.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 15:49:25 -0700 (PDT)
Date:   Sat, 5 Jun 2021 15:49:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thorsten Frielingsdorf <thorsten@frielingsdorf.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: Keyboard not detected
Message-ID: <YLv/c7y50jMrHJYe@google.com>
References: <5dfcadc3-823c-4f91-3b99-4a154b2766c3@frielingsdorf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dfcadc3-823c-4f91-3b99-4a154b2766c3@frielingsdorf.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thorsten,

On Sat, Jun 05, 2021 at 11:27:53AM +0200, Thorsten Frielingsdorf wrote:
> Dear Dimitry Torokhov,
> 
> 
> I'm not sure if this is the right place. If I should use the kernel bugzilla
> please ask.
> 
> 
> I'm on latest Manjaro.
> 
> The system doesn't recognize the keyboard of the notebook Medion Akoya
> S17405. At the moment I'm on kernel |5.10.36-2-MANJARO.| I've tested
> different kernels including the latest available kernel |5.13 rc1| with the
> same problem. The issue is also present on other distributions like Ubuntu.
> 
> I made a bugreport at libinput
> (https://gitlab.freedesktop.org/libinput/libinput/-/issues/607), the
> maintainer tells me it's a kernel issue.
> 
> 
> I attached some files to to give you the needed information, if I miss
> something please tell me.
> 
> The keyboard works fine in BIOS and Grub menu. Additionally some special
> keys are working like screen brightness or power button.

I think this might be https://bugzilla.kernel.org/show_bug.cgi?id=213031

Can you please tell me if adding "noapic" to the kernel command line
helps with the keyboard?

Thanks.

-- 
Dmitry
