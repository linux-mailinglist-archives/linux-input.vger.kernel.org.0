Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25DC2E94A9
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 13:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbhADMVW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 07:21:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:45860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbhADMVW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 07:21:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E0C220757;
        Mon,  4 Jan 2021 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609762841;
        bh=6c7/xxgP7rlZ1KYuz5WGwjdn1b7RkYbjLEWIOX2sjBY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VzywpTqjYRhJ0zaUtsaP3KN+NaRExYB5aQxCOC9OtF5JG2VCLiHE0YsezfAxHHCkb
         JMPaP0qpxJRvKYk5XM/VwpRpuO8xLjAXv13m28Vl4FKOseQZXO1/cz37eLgN/w/pn5
         +qy7PN60WT6D+6NCU54Z7xh5gWIfrNe2d+Wd/nFScYCU6g6KfUN+Z2Fkxt1Eia2Uk+
         t+pgJIfmIgxDg8KheooM4BBR7q4Z+DiNFATwajDLzUWu70niyMVbFbkz1TB+wXF0Iy
         l3+HKTdn3wPZSzbZCZkOyzubb+hRKPeAoAc5FyItr01oz2g5IiazWwn11mcCSvK6kq
         ay0NmZFvYmaUg==
Date:   Mon, 4 Jan 2021 13:20:38 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v2 01/13] HID: playstation: initial DualSense USB
 support.
In-Reply-To: <20210102223109.996781-2-roderick@gaikai.com>
Message-ID: <nycvar.YFH.7.76.2101041318440.13752@cbobk.fhfr.pm>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-2-roderick@gaikai.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2 Jan 2021, Roderick Colenbrander wrote:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
> Implement support for PlayStation DualSense gamepad in USB mode.
> Support features include buttons and sticks, which adhere to the
> Linux gamepad spec.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  MAINTAINERS                   |   6 +
>  drivers/hid/Kconfig           |   9 +
>  drivers/hid/Makefile          |   1 +
>  drivers/hid/hid-ids.h         |   1 +
>  drivers/hid/hid-playstation.c | 321 ++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-quirks.c      |   3 +
>  6 files changed, 341 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f81d598a8556..0ecae30af074 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7918,6 +7918,12 @@ F:	drivers/hid/
>  F:	include/linux/hid*
>  F:	include/uapi/linux/hid*
>  
> +HID PLAYSTATION DRIVER
> +M:	Roderick Colenbrander <roderick.colenbrander@sony.com>
> +L:	linux-input@vger.kernel.org
> +S:	Supported
> +F:	drivers/hid/hid-playstation.c
> +
>  HID SENSOR HUB DRIVERS
>  M:	Jiri Kosina <jikos@kernel.org>
>  M:	Jonathan Cameron <jic23@kernel.org>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 7bdda1b5b221..d3258e806998 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -853,6 +853,15 @@ config HID_PLANTRONICS
>  
>  	  Say M here if you may ever plug in a Plantronics USB audio device.
>  
> +config HID_PLAYSTATION
> +	tristate "PlayStation HID Driver"
> +	default !EXPERT

Minor nit: these '!EXPERT' defaults are there only for drivers that were 
created during the big "let's separate all the quirks from hid-core into 
individual driver" bang that happened ages ago. For new drivers, we follow 
what's common in other driver subsystems, and don't force the default.

No need to resend if it'd be just for this change, I can adjust it when 
applying.

Thanks,

-- 
Jiri Kosina
SUSE Labs

