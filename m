Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1AB44DA4C
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 17:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbhKKQ14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 11:27:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:44122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232033AbhKKQ14 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 11:27:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3C246124C;
        Thu, 11 Nov 2021 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636647906;
        bh=dw0x+LBQ552ApvZujaQIillgV6iC1yb5QQ5PK/digpQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=AQu3TUpVccJo4t7u3W3hOW69QX8iDiJz8OrLBhAO1QJQhPdKguQishmbKqVi6KrON
         y4Y1KdAToySCDwJx9OJe8PlwiVd8iH+62xubOBPXSX4/je/rqHZlzpwqUDKGGJOlBe
         JHrylfyQcRyOxdnTwLdaz4cDrFyiXV5nKWjAf4NHj3/Zdrk464+HTyk5p+abcqtEpH
         0QAFVoqJ6ikODrnzHA9r0CSTLyuEMKHkXiLqX9H8Dt0CAzgbM9DN6/KfakeV/fxgb1
         co0YrhJzDbDXLs/8QRANEXorz+wzMF9NoJJZ4drQ4H+AWxwdjD6deloua9TyTpidos
         Z9Jv8NfiG3S6g==
Date:   Thu, 11 Nov 2021 17:25:01 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] HID: intel-ish-hid: fix module device-id handling
In-Reply-To: <20211111085842.2846422-1-arnd@kernel.org>
Message-ID: <nycvar.YFH.7.76.2111111723190.12554@cbobk.fhfr.pm>
References: <20211111085842.2846422-1-arnd@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 11 Nov 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> A late addititon to the intel-ish-hid framework caused a build failure
> with clang, and introduced an ABI to the module loader that stops working
> if any driver ever needs to bind to more than one UUID:
> 
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:1067:4: error: initializer element is not a compile-time constant
> 
> Change the ishtp_device_id to have correct documentation and a driver_data
> field like all the other ones, and change the drivers to use the ID table
> as the primary identification in a way that works with all compilers
> and avoids duplciating the identifiers.
> 
> Fixes: f155dfeaa4ee ("platform/x86: isthp_eclite: only load for matching devices")
> Fixes: facfe0a4fdce ("platform/chrome: chros_ec_ishtp: only load for matching devices")
> Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
> Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
> Fixes: cb1a2c6847f7 ("HID: intel-ish-hid: use constants for modaliases")
> Fixes: fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I have fixed the ecl_ishtp_cl_driver.id initialization and applied. Thanks 
a lot for spotting and fixing this, Arnd.

-- 
Jiri Kosina
SUSE Labs

