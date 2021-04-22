Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129DF3684E6
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 18:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhDVQdM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 12:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237972AbhDVQdI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 12:33:08 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B42C06174A;
        Thu, 22 Apr 2021 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=HBW9pi1AtwAKNZXHGCpKKjsedA+rzUKisGIAxuDRPPE=; b=KPw58ASa5uatO+OME3CXuHpLgP
        fO2sTkNeWLtDXLbD0fyJZm8OxTjbxJjjBBy5Ed1OPurDQrwSjaKjh0F2ZwsTI0YUbbadhQbwKWgqf
        IL5nAwmi8tLxwgZtYq5aWPOIh4tCEGVkpwpr+XOVOyNXdKJ7lpDn1SUqFw+2HIQUqN2zL/OIh9aPS
        fSuu+f+82Wf4XmxD6OspvX/fOpWhhNP3l1wVI/VAA2D8HwgmuUtcXH424UU+kkzRgSHHgfRn5r7IF
        a5E+yguRdBE5GPwqDHNG7Ys5uij5+qiGUDn/8ewV5W9dQ+bgHNjS5qYzxS9zZsLUR7btA0nU3Jn7R
        1NQln+Mg==;
Received: from [2601:1c0:6280:3f0::df68]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZcFj-00H5cH-CO; Thu, 22 Apr 2021 16:32:31 +0000
Subject: Re: [PATCH] Input: rework USB Kconfig dependencies
To:     Arnd Bergmann <arnd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210422133647.1877425-1-arnd@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <74e04402-58b3-b1e5-4f72-9fe227f21b35@infradead.org>
Date:   Thu, 22 Apr 2021 09:32:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210422133647.1877425-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/22/21 6:36 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A lot of input drivers traditionally depend on CONFIG_USB_ARCH_HAS_HCD
> and select CONFIG_USB. This works but is different from almost every
> other subsystem in the kernel.
> 
> I found this when debugging a build failure in the RC subsystem that
> had the same logic.
> 
> The problem here is that CONFIG_USB_ARCH_HAS_HCD no longer has
> a meaning since the host controller support has been changed to
> use machine specific loadable modules for the USB host. Selecting
> a subsystem that a driver needs is confusing and can lead to
> recursive dependency chains in Kconfig.
> 
> In both cases, the normal logic is to specify 'depends on USB'.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/input/joystick/Kconfig    |  6 ++----
>  drivers/input/misc/Kconfig        | 15 +++++----------
>  drivers/input/mouse/Kconfig       |  9 +++------
>  drivers/input/tablet/Kconfig      | 15 +++++----------
>  drivers/input/touchscreen/Kconfig |  3 +--
>  5 files changed, 16 insertions(+), 32 deletions(-)
> 


-- 
~Randy

