Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA10E34B960
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 21:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhC0Uuf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 16:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhC0Ut7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 16:49:59 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE42C0613B1;
        Sat, 27 Mar 2021 13:49:58 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x21so10089614eds.4;
        Sat, 27 Mar 2021 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J5/24Y1HRbqKLMVsAjkgtC4R+VEoPIYHfduIjqVFFqM=;
        b=HzuFnYYzpmZqnA61TbAo/vZmk86AjKThTnhsn1zhLbNTWT/pQvL8lDijJg/oYbzBQN
         9MF+QEsOIpE9oFM/9Nr2qJEYtohgsE+kRvbgnWPSL5mfB9h5a+GYA9UY1q0u6UFbvSab
         1iwNY70JlnfHmh+C+fCw67pZ2/q/gEL7djAUyl0jGubnIzLIdzZOiSfutP3sWsGnYbXy
         BxA0GHlhHGLYYozqZXOdzZPC60KHD9t2Rt1RvbiUBicLOrOM4NJSYUjYnpzwHLuiU7Kh
         DT7ibJZCb2U4BkSfKJVwt+hPW3/IMWJlruAsBauq8oiukMj0gYtXyxUyAmgLk78pMhDt
         k4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J5/24Y1HRbqKLMVsAjkgtC4R+VEoPIYHfduIjqVFFqM=;
        b=GewFM/BmZQARCkt98eA7R5T4iqPhd3HNkEz+iRIi2QP9ptC2pVdntVg1R0IvEqaM3H
         7xdcf3DGO2c1pCPBxPVjTNFzBHysLAoc+/3aDKstDnTfMcROVlIRDJjOAsZd0UYZ+BOd
         7/saRGO8h5/g+3Cw9yhSMqZsnxkUOUBc50dVDZjb5m02d6w9sbVdmfp7OHYWB2sesauj
         yB08VRz0ORneQbwz5LrhWC6Eqos1oRMO1nvlVw6E88ocGCU4FzHk1yTlDzEy3jCpAu+0
         93E6osixau4bHVHCpZprumtu0SwfVsGne4b2Rfi7wRpPjG6GHYJRH7GvB8xRA46ybmpT
         Vp3A==
X-Gm-Message-State: AOAM532fqr24Q7/DoImZI+wZHqKLbFvf/75Qceq7hEruzO1VveWXcPk4
        fE8saFDzUUizq2TE7YTsuZ2LK4eicRJKWQ==
X-Google-Smtp-Source: ABdhPJxVikLb6CEbi0LWa6mameCASsWagrkxrJiLCA7DJQL3dKOyr1HOTI3YRhj5FoNFAOxY/B/wSg==
X-Received: by 2002:a50:f391:: with SMTP id g17mr21580260edm.26.1616878196174;
        Sat, 27 Mar 2021 13:49:56 -0700 (PDT)
Received: from [10.19.0.7] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id m14sm6352332edr.13.2021.03.27.13.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Mar 2021 13:49:55 -0700 (PDT)
Subject: Re: [PATCH 0/2] HID: Add support for Surface Aggregator Module HID
 transport
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <a0e28af7-3451-83a5-ca16-e230ec70c518@gmail.com>
Date:   Sat, 27 Mar 2021 21:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/10/21 11:53 PM, Maximilian Luz wrote:
> This series adds support for the Surface System Aggregator Module (SSAM)
> HID transport subsystem.
> 
> The SSAM is an embedded controller, found on 5th- and later generation
> Microsoft Surface devices. On some of these devices (specifically
> Surface Laptops 1, 2, and 3, as well as Surface Book 3), built-in input
> devices are connected via the SSAM. These devices communicate (mostly)
> via normal HID reports, so adding support for them is (mostly) just a
> matter of implementing an HID transport driver.
> 
> SSAM actually has two different HID interfaces: One (legacy) interface
> used on Surface Laptops 1 and 2, and a newer interface for the rest. The
> newer interface allows for multiple HID devices to be addressed and is
> implemented in the first patch. The older interface only allows a single
> HID device to be connected and, furthermore, only allows a single output
> report, specifically one for the caps lock LED. This is implemented in
> the second patch.
> 
> See the commit messages of the respective patches for more details.
> 
> Regards,
> Max
> 
> Note: This patch depends on the
> 
>      platform/surface: Add Surface Aggregator device registry
> 
> series. More specifically patch
> 
>      platform/surface: Set up Surface Aggregator device registry
> 
> The full series has been merged into the for-next branch of the
> platform-drivers-x86 tree [1]. The commit in question can be found at
> [2].
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde
> 
> Maximilian Luz (2):
>    HID: Add support for Surface Aggregator Module HID transport
>    HID: surface-hid: Add support for legacy keyboard interface
> 
>   MAINTAINERS                                |   7 +
>   drivers/hid/Kconfig                        |   2 +
>   drivers/hid/Makefile                       |   2 +
>   drivers/hid/surface-hid/Kconfig            |  42 +++
>   drivers/hid/surface-hid/Makefile           |   7 +
>   drivers/hid/surface-hid/surface_hid.c      | 253 +++++++++++++++++
>   drivers/hid/surface-hid/surface_hid_core.c | 272 +++++++++++++++++++
>   drivers/hid/surface-hid/surface_hid_core.h |  77 ++++++
>   drivers/hid/surface-hid/surface_kbd.c      | 300 +++++++++++++++++++++
>   9 files changed, 962 insertions(+)
>   create mode 100644 drivers/hid/surface-hid/Kconfig
>   create mode 100644 drivers/hid/surface-hid/Makefile
>   create mode 100644 drivers/hid/surface-hid/surface_hid.c
>   create mode 100644 drivers/hid/surface-hid/surface_hid_core.c
>   create mode 100644 drivers/hid/surface-hid/surface_hid_core.h
>   create mode 100644 drivers/hid/surface-hid/surface_kbd.c
> 

Hi, is there any status update on this?

Regards,
Max
