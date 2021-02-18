Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FAD31E765
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 09:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhBRIZm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 03:25:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:43384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhBRIXF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 03:23:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5FC56146D;
        Thu, 18 Feb 2021 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613636540;
        bh=aFapOCdUF6fjMrXH2RbLfzvogE5cf4sdIO6Y2iY0GwI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=P6wwuv6IAbLk7OPHIx9VxsVF2xg1NCCy/bPJ7oPrJVMnSDh3/Dv7bQhwBoqy7AtH2
         lRmp5OIPTCp2xRo2OeuZvsh0GY0LFNgVke06V1StrZnANMD756otzmRCA4gASAbAOb
         /2bpZlm0Xv9T6xX5EqspKqts3CEhwyYE8g0Ti0Q4vtMNQpzbmIVeZq52VohyAYxag6
         IYPz5xdUYuYAriCIKf4ThdfKcTi9GcdS3KAM+YiBbupoImJDF5PtXrRLrRcU2h1ZsL
         ACk8Z7bfp2Zqe9nydwrKIOZd+zwjVruGhuc3W/t6uC/9erqHkUD5ogu5OAfwBuBlpI
         Okq3QaEGFSxUw==
Date:   Thu, 18 Feb 2021 09:22:16 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] HID: playstation: revert LED class exposure
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
Message-ID: <nycvar.YFH.7.76.2102180921170.28696@cbobk.fhfr.pm>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 17 Feb 2021, Benjamin Tissoires wrote:

> [sending those patches on behalf of Roderick]
> 
> There is a current thread on LED LKML which basically means that
> we have to revert the LED class exposure until things are settled.
> 
> I am sending here the full series that will end up in linux-next.
> But with some git magic, the final PR to Linus will not have the
> reverts in it, just the plain patches.
> 
> I am queuing in for-5.12/playstation patches 1 to 6 immediately
> (the reverts).
> 
> I am also queuing in for-5.12/playstation-v2 patches 7 and 8 on
> top of 51151098d7ab8 immediately. Those 2 patches have already
> been reviewed the usual process.
> 
> I am waiting 1 day for others to chime in regarding patches 9 to
> 11 before applying them to for-5.12/playstation-v2. They are
> basically the same patches that were already reviewed on the
> linux-input LKML, but without the LED class bits.

FWIW, as discussed elsewhere, I am fully in favor of this solution. 
Thanks!

-- 
Jiri Kosina
SUSE Labs

