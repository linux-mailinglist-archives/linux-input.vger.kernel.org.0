Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020A72ECCA7
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 10:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbhAGJXp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 04:23:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:45282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbhAGJXo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Jan 2021 04:23:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E99C723333;
        Thu,  7 Jan 2021 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610011384;
        bh=fUe6brqzWrzBL0dE6S7HO3nBiQXWyOVA7ksDCQhkpDI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KFrrF/ccyp3NvFwBgBHWKsfNW2bj5rovi4bcXgJM/dY78leou+dbjopALdyj9PfO7
         1ufzSAyGTMd0jnb2/wM1s3UbFBvyeo0qdkJIYebOTrrd9dZqilTbT/rz7YDFPhE5sb
         2V58OS5zHO5T0hJBgKRTdQwdFc2fyf5z0CdtURDNuHely6zZLumT25fwcQsfJHkHDw
         dy3TYoZniOBb/beclxJCAG+xOkHkG/JyamOj8Bmb5p6na1wLQL2YZqKzYYZFUR5k2N
         R6joyUyPTmr/vVSNNgsaC1ItJf5+UGZfGGUnLiERcypcC8NW5/GH/LxRASNRwm1bdj
         VD4xG627qy7bA==
Date:   Thu, 7 Jan 2021 10:23:00 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jian-Hong Pan <jhp@endlessos.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chris Chiu <chiu@endlessos.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@endlessos.org
Subject: Re: [PATCH v2] HID: Add Wireless Radio Control feature for Chicony
 devices
In-Reply-To: <20201223055540.204685-1-jhp@endlessos.org>
Message-ID: <nycvar.YFH.7.76.2101071019010.13752@cbobk.fhfr.pm>
References: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com> <20201223055540.204685-1-jhp@endlessos.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 23 Dec 2020, Jian-Hong Pan wrote:

> Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> "Wireless Radio Control" feature. For example, the wireless keyboard
> [04f2:1236] shipped with ASUS all-in-one desktop.
> 
> After consulting Chicony for this hotkey, learned the device will send
> with 0x11 as the report ID and 0x1 as the value when the key is pressed
> down.
> 
> This patch maps the event as KEY_RFKILL.

I don't know how exactly does the report descriptor of that device look 
like, but is this not doable from userspace via setkeycode() (udev/systemd 
is shipping a lot of such mappings already -- see evdev/keyboard 
definitions in hwdb).

Thanks,

-- 
Jiri Kosina
SUSE Labs

