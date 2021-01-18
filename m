Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79A32F9DA6
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 12:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389131AbhARKsP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 05:48:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:37652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389375AbhARJ4p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 04:56:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D82522228;
        Mon, 18 Jan 2021 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610963765;
        bh=hAH879fCCZw1dfCtLfrTzmyt6X6aM8UCFrEg1gU8pUU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pKACODJC7FKzF8TgNnaJRUhxSrJSD3VTZ/9rpSTGa0A749r7pjMFpcB0fupmgNYwD
         8P53sRRPlsLlnLlu+k5eq25YKtr104pRmMd+eigkzpI7pq9zKUMIy+5XWR9kuosWZN
         SLJt3eCVx/92huYmILbIM4iAkXF/aZsDu3PO/YVkVFzUFxy52Ab0clb+9Zj63+NqYn
         xCioDcWu//N8v2MFaIk5IOq9fQCvmEg9p+GT4gZ/Jq4M3nakmUvzl19hcK3TvRdMjC
         hHLoirWVokaQNWweQ/zqPF2XoJMaM3l6mDo+YErenvl17pxVwIz1Z8Dux+KX9OmpVB
         Ghl7DkTpyAFYA==
Date:   Mon, 18 Jan 2021 10:56:02 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sanjay Govind <sanjay.govind9@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pascal.Giard@etsmtl.ca
Subject: Re: [PATCH v2] HID: sony: Add support for tilt on guitar hero
 guitars
In-Reply-To: <20201204054526.148299-1-sanjay.govind9@gmail.com>
Message-ID: <nycvar.YFH.7.76.2101181054520.5622@cbobk.fhfr.pm>
References: <20201130194314.89509-1-sanjay.govind9@gmail.com> <20201204054526.148299-1-sanjay.govind9@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 4 Dec 2020, sanjay.govind9@gmail.com wrote:

> From: Sanjay Govind <sanjay.govind9@gmail.com>
> 
> This commit adds support for tilt on Standard Guitar Hero PS3 Guitars, and GH3 PC Guitars, mapping it to ABS_RY.
> 
> Note that GH3 PC Guitars are identical, only they use different VID and PIDs.
> Also note that vendor id 0x12ba is used by a variety of different rhythm controllers on the ps3.
> 
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
> 
> Fix some incorrect constants after a refactor

I have removed the sentence above and applied, thanks.

-- 
Jiri Kosina
SUSE Labs

