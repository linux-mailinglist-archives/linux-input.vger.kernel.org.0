Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2973F2C22
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240405AbhHTMdy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:33:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240403AbhHTMdx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:33:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0600E60FE7;
        Fri, 20 Aug 2021 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629462796;
        bh=p4Fu8l5xImMj78m8c3VG9X/iSCFJyn0E1U9CKRy05CU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=DdSg0TSdNexSYarPTzzX16Qdlmzo7Mw5WfhQ276afmngf4fEfKR07PyNFWSeRuqra
         /FNwfukPFCKiYyM7X4ISgWDl461pFp7WyKqA6WjRXYX2K0//G1UhCZXnwUkB+3oWQx
         lkRjETA1mTm7zEeAvL/gBL89F4C5ARdQzsiSwoo5TAJXTeXAL8XAhcZwWX5g9Q4uOI
         zIwLKpbOcqB9KrQoxY71/ULdqvvF9pClsViqkjLwXhKBvfoHZ09OX5C6pK2Cfg51lO
         hs9TREgnYfYnfGQZxmUIA3TRODW/91InhPEpn9kxXi7mD3pHcmsS0/K257fMJ5mLjT
         npuTZ0xLkMNiw==
Date:   Fri, 20 Aug 2021 14:33:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hamza Mahfooz <someguy@effective-light.com>
cc:     linux-kernel@vger.kernel.org,
        =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v4] HID: logitech-hidpp: battery: provide CAPACITY property
 for newer devices
In-Reply-To: <20210802125232.65188-1-someguy@effective-light.com>
Message-ID: <nycvar.YFH.7.76.2108201433050.15313@cbobk.fhfr.pm>
References: <20210802125232.65188-1-someguy@effective-light.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2 Aug 2021, Hamza Mahfooz wrote:

> For devices that only support the BATTERY_VOLTAGE (0x1001) feature, UPower
> requires the additional information provided by this patch, to set them up.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> 
> v2: use ARRAY_SIZE() and set voltages[]'s size to 100
> 
> v3: add a check to ensure that exactly 100 elements are in voltages[]
> 
> v4: add a note regarding the voltage curve and introduce a bounds check on
>     the reported voltage

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

