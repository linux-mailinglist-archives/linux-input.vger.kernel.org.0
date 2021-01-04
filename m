Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E32E981A
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 16:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbhADPLM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 10:11:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:53348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbhADPLL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 10:11:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 415E8207BC;
        Mon,  4 Jan 2021 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609773031;
        bh=FROxPylQXGGqO0gde1novQMo6H2UxUMrf/hVOlfivqQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XCO8nqR3R00Jmj40W5sZtxpIubt4nUhMCg6ocuGMrdYMBQkpyXlxsl4WTdABGc21E
         DaykJB451cCBpfADNfnDMYd769xH7BpIe7h7fzh5gDKMFUxwh2knDy58HkNjTisjB0
         kAMRr4qjnl1YkxkD3SRY4niQNXC16z2/Vzbl4QTGH9J25QDfY1DaHCY+UZMmP4WlvP
         KW2hs9nR4jXKDIMU1K4U2W6yzLsFxm2VaxKWwVRmxTAgrAC6zop3SSvSCaY08Gj3a2
         7taGKpaJa1JA8IcKLLmvwTftae66Y7rVr5zVaVebEdqgaZV3GaHc2TkkKG0bDLSY/O
         PF48ax61Ti/2g==
Date:   Mon, 4 Jan 2021 16:10:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Rishi Gupta <gupt21@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: sony: select CONFIG_CRC32
In-Reply-To: <20210103214159.1996262-1-arnd@kernel.org>
Message-ID: <nycvar.YFH.7.76.2101041610170.13752@cbobk.fhfr.pm>
References: <20210103214159.1996262-1-arnd@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 3 Jan 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without crc32 support, this driver fails to link:
> 
> arm-linux-gnueabi-ld: drivers/hid/hid-sony.o: in function `sony_raw_event':
> hid-sony.c:(.text+0x8f4): undefined reference to `crc32_le'
> arm-linux-gnueabi-ld: hid-sony.c:(.text+0x900): undefined reference to `crc32_le'
> arm-linux-gnueabi-ld: drivers/hid/hid-sony.o:hid-sony.c:(.text+0x4408): more undefined references to `crc32_le' follow
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks Arnd.

-- 
Jiri Kosina
SUSE Labs

