Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946E939153E
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbhEZKqN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:46:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234034AbhEZKqK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:46:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D00D1613D3;
        Wed, 26 May 2021 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622025879;
        bh=6Z4pHqWBFL4+NnMmSLTg0IhsxKB/BpUB7Hlh/TSkQww=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Rz75V34ZSLNGrtay7qx/vSs+FW2ut0JgoU4g8CareFZX9xBuuHtN2a/CcecwoSnaX
         Tlz8ryPPolVhDNlM7T741vtRS/qz2IHUVMpZzII6i5E/0wnkGu2mNeBwHWR+MtnGGP
         UHxJPncCHDGVtI9GbRY3EF0Z3pAvMA9PbjPkFf6MIOmI6fLCWVdY/ipg+BNw2LcAt7
         mRBIG1mdvJCZ8LCL/+dE2bdNWrAZO589dRHQsTo+ccrNFa42B8HYMPselxIEfPi7bD
         Grb1JVDcEkcMHhujaS1SEmlWPokEIbOWBLI/zdHPfxqA4mGl6Makft07FPFNM908b+
         62TK8smMtEbUA==
Date:   Wed, 26 May 2021 12:44:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: magicmouse: fix crash when disconnecting Magic
 Trackpad 2
In-Reply-To: <20210510062237.319457-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2105261244270.28378@cbobk.fhfr.pm>
References: <20210509155138.39601-1-jose.exposito89@gmail.com> <20210510062237.319457-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 10 May 2021, José Expósito wrote:

> When the Apple Magic Trackpad 2 is connected over USB it registers four
> hid_device report descriptors, however, the driver only handles the one
> with type HID_TYPE_USBMOUSE and ignores the other three, thus, no driver
> data is attached to them.
> 
> When the device is disconnected, the remove callback is called for the
> four hid_device report descriptors, crashing when the driver data is
> NULL.
> 
> Check that the driver data is not NULL before using it in the remove
> callback.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

