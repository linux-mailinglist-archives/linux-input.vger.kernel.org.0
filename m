Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3443D8B1D
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhG1Jvl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:55412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231761AbhG1Jvk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:51:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AE9D60F9C;
        Wed, 28 Jul 2021 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627465899;
        bh=6XSgtXtVeQ4/idewd/tjzuG/8smMnxBvlTYKf/uR2l0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mn+iqEXWtVB0BLBi52XV0jZD9Z5BLVHrS+u0E7NHFM+1V5qv7EptR/1seHRXuL/Xt
         ol4ZjgrFvXvpPugvXCkStVadfbLkI5lkZESFpdojcA/R4fHq+G3Z6WWrhFeJWNX2ST
         oWqnOpockA8Bu/8YUkRceqBfYTRd7J28Q6lrx1yJeN3DCUTN71sRgUGHia1PnKGr+/
         oJQ7+M3EgRuCAqQ+nzcamUoaaFaCGOOazoVTd/Tpb01HagC8pbPFZh/y981Uz/q+OE
         ct6Teej3Dg9NA9ple5mFiz8xQZ4h7z98GcBJmtxlkgEI/W/3LxB2gPMS6eIz41FRdb
         YXinglaAWFSWw==
Date:   Wed, 28 Jul 2021 11:51:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Ben Chen <ben_chen@bizlinktech.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] HID: cmedia: add support for HS-100B mute button
In-Reply-To: <20210720202708.341057-1-linux@weissschuh.net>
Message-ID: <nycvar.YFH.7.76.2107281151280.8253@cbobk.fhfr.pm>
References: <20210720202708.341057-1-linux@weissschuh.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 20 Jul 2021, Thomas Weißschuh wrote:

> These chips report mute button events in bit 4 of their report without it
> being part of the report descriptor.
> Use a custom descriptor that maps this bit.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> 
> v1: https://lore.kernel.org/linux-input/a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de/
> 
> v1 -> v2:
>  * Merged into the existing cmedia driver instead of creating a dedicated
>    driver.
> 
> v2: https://lore.kernel.org/linux-input/20210716160659.154779-1-linux@weissschuh.net/
> 
> v2 -> v3:
>  * Fixed cosmetic checkpatch warnings
>  * CC-ed Ben Chen who is the original author of hid-cmedia.c
> 
> v3: https://lore.kernel.org/linux-input/20210719110911.310701-1-linux@weissschuh.net/
> 
> v3 -> v4:
>  * Create a dedicated struct hid_driver, leaving the existing intact
>  * Drop entry in hid-quirks.c

Applied, thanks Thomas.

-- 
Jiri Kosina
SUSE Labs

