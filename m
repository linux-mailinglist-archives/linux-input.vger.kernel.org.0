Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A05457130
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbhKSOzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:55:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:45116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhKSOzx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:55:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D557615E2;
        Fri, 19 Nov 2021 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333571;
        bh=QQmlfnUygM+hdTF0UxFHAkG8aeyDP2p1IhOC6VqxCRc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WMpItRaNkMKvlLHHqxMrbfYOek9B4uB2fDTK5qN2wMm3gym0VQcDDFHpRUk9OhvNR
         2HXX+V1fYu812hV3a3aK6VOyUC9dZg+aXJE6n3pfE2jz4ZqMRxv+ZS91KZEX+wBkvJ
         vK8cDW4jjqrUCQiKZnSmsiv/ziGKECCcb04/J6icddtUq0Tlsw25gOBJaeoXHM1lCj
         NwZsd39LGA8VJ9wqgoS0+6dA6zz8zb7waZudas+jV8ThfOMLZQghnDJc+709kUu1c+
         8FZcG8//nY5zX7HHH0f+DYxqD1yLZGnQUZhJHPMzXTOoJT0LBhdXDYwVOoaEPy+fug
         hl1bp587HSIGw==
Date:   Fri, 19 Nov 2021 15:52:48 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] HID: logitech: add myself as a reviewer
In-Reply-To: <20211111164411.2978353-1-lains@riseup.net>
Message-ID: <nycvar.YFH.7.76.2111191552210.16505@cbobk.fhfr.pm>
References: <20211111164411.2978353-1-lains@riseup.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 11 Nov 2021, Filipe Laíns wrote:

> Currently, I have to use a separate email address and maintain several
> filters to monitor changes to Logitech drivers, so that I can have an
> opportunity to review them. Since I am very interested in keeping up
> with the changes, as I have a lot of the hardware and maintain the main
> userspace stacks that depend on these drivers, I would like to mark
> myself as a reviewer. I would also be open to be marked as a maintainer
> if Benjamin thinks it makes sense.
> 
> Signed-off-by: Filipe Laíns <lains@riseup.net>

I've applied this one now. Please send a followup with M: entry if you and 
Benjamin agree on it, no objections from me.

Thanks,

-- 
Jiri Kosina
SUSE Labs

