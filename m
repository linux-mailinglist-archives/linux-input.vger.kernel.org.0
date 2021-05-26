Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33791391552
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbhEZKuh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:50:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233959AbhEZKug (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:50:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C143F610A8;
        Wed, 26 May 2021 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622026145;
        bh=TSSvNDUIoJTXJ/LJROSxxiw8o+OmuykYbaXrTyzuKis=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=D7TqMxxwmLrc1ZUcvLvWWEuIixbxveLpgPtE3SlJhz3FUUgn7Ub0e9p2OrH3K0qAM
         OIMy/iASQ10VGqf1yZVOVbUUyG3cXLLh2IommX6TpqqeOETT1rke7bOyGr+WW1mRUA
         /QRkR9WrQTuq/ohhBaVvZeEMjG2nsYaNPY8n7Wvefq1VcLey8ANj9lP8QQ6DT8C6Ji
         OsBFS9LfCFFDrG4ldQgRo2M3WpvGgVE8lstMzE5rsbs0xenT6ODAL385E6pKW0udj3
         urKmbszXyN0u2RCwPBd97Trf3gc822Us2GWXlQ+Vb5O9M8oxLj24wHbgDt4hV4Eu8R
         B0xAfkYmaAhiw==
Date:   Wed, 26 May 2021 12:49:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Julian Sax <jsbc@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        Coiby Xu <coiby.xu@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] HID: i2c-hid: fix format string mismatch
In-Reply-To: <20210514135901.2924982-1-arnd@kernel.org>
Message-ID: <nycvar.YFH.7.76.2105261248530.28378@cbobk.fhfr.pm>
References: <20210514135901.2924982-1-arnd@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 May 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang doesn't like printing a 32-bit integer using %hX format string:
> 
> drivers/hid/i2c-hid/i2c-hid-core.c:994:18: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
>                  client->name, hid->vendor, hid->product);
>                                ^~~~~~~~~~~
> drivers/hid/i2c-hid/i2c-hid-core.c:994:31: error: format specifies type 'unsigned short' but the argument has type '__u32' (aka 'unsigned int') [-Werror,-Wformat]
>                  client->name, hid->vendor, hid->product);
>                                             ^~~~~~~~~~~~
> 
> Use an explicit cast to truncate it to the low 16 bits instead.
> 
> Fixes: 9ee3e06610fd ("HID: i2c-hid: override HID descriptors for certain devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks Arnd.

-- 
Jiri Kosina
SUSE Labs

