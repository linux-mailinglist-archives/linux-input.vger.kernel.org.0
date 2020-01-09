Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDEF13565A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2020 10:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgAIJ6Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 04:58:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:52746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729885AbgAIJ6X (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Jan 2020 04:58:23 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BA162072A;
        Thu,  9 Jan 2020 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578563903;
        bh=W22YMCGf72ulx5GiyptyQL4HmT2B/Gtirt7M/S2L2Ng=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DOJeDhmhrVHdsx3uZNP4YVe5V64IX2VpvppEpLywf8HUw58fw/A44aHXqhJTMT1J+
         X2TImR3XWR2Z5TABf5wne53ae4f/bTf974ynS06CMoaU6P7DCJBMt0Eg6x6+h5vykh
         oW4Blzag/uKPswv44hELlA0IllQYM2lEhs3tEU6U=
Date:   Thu, 9 Jan 2020 10:58:13 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH] HID: steam: Fix input device disappearing
In-Reply-To: <20200107194813.162038-1-rodrigorivascosta@gmail.com>
Message-ID: <nycvar.YFH.7.76.2001091058020.31058@cbobk.fhfr.pm>
References: <20200107194813.162038-1-rodrigorivascosta@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 7 Jan 2020, Rodrigo Rivas Costa wrote:

> The `connected` value for wired devices was not properly initialized,
> it must be set to `true` upon creation, because wired devices do not
> generate connection events.
> 
> When a raw client (the Steam Client) uses the device, the input device
> is destroyed. Then, when the raw client finishes, it must be recreated.
> But since the `connected` variable was false this never happended.
> 
> Signed-off-by: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

