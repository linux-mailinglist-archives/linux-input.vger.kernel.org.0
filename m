Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDF12C4100
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgKYNSL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgKYNSK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:18:10 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41344206E5;
        Wed, 25 Nov 2020 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606310290;
        bh=J9gO+WXJ4CAYXF2VqrRZILd+9qWaibHE2TyAtPX5gyM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IqK18eKtowgWvbkaZid+fZL1VztUCibnpEpeAfbPikkhXZwYbtrVRG0KoYGL7RLuH
         2+PvOcCx75Kclc8kH02z6+NSJTYxHYYM+NtB5TKzoaVvWnz+pzloM5DD6lOES7WxID
         hKbdskIY8Sn7C8NP2SOZtFQsw4oN5E+IF9jEiCSE=
Date:   Wed, 25 Nov 2020 14:18:07 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: Constify attribute_groups
In-Reply-To: <20201124230109.67543-1-rikard.falkeborn@gmail.com>
Message-ID: <nycvar.YFH.7.76.2011251417570.3441@cbobk.fhfr.pm>
References: <20201124230109.67543-1-rikard.falkeborn@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 25 Nov 2020, Rikard Falkeborn wrote:

> These are never modified, so make them const to allow the compiler to put
> them in read-only memory. It also allows the compiler to shrink the
> resulting module with ~900 bytes, test-built with gcc 10.2 on x86_64.
> 
>    text    data     bss     dec     hex filename
>  204377   42832     576  247785   3c7e9 drivers/hid/wacom_old.ko
>  204240   42064     576  246880   3c460 drivers/hid/wacom_new.ko

Applied, thanks Rikard.

-- 
Jiri Kosina
SUSE Labs

