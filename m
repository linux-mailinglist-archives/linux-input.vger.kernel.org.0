Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2142169FA
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 12:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgGGKUA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 06:20:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbgGGKTq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 06:19:46 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 402F9206DF;
        Tue,  7 Jul 2020 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594117168;
        bh=R3l7w7sSMwxmhD6/XB+NrMzrnx3QnVGQA0T4xmwnAb4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=MeCQsaO5aZfTEGpDaMWARAHdZUqxdjXcW+aMPls5l8OmXIFJ3jdv57W7VshLELA1E
         pCPXl6L1nAvgDBAY6u0qlrqvgipXsrARNcyloD7AAd/2+PHR7noB6U9NdhmUfsk0Vl
         scaF1lxtQEu9irmyIIAjOQRa+dEZHWSQtN4t+M9A=
Date:   Tue, 7 Jul 2020 12:19:25 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     srinivas.pandruvada@linux.intel.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
In-Reply-To: <20200629041648.19113-1-kai.heng.feng@canonical.com>
Message-ID: <nycvar.YFH.7.76.2007071219140.15962@cbobk.fhfr.pm>
References: <20200629041648.19113-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 29 Jun 2020, Kai-Heng Feng wrote:

> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
> 
> Instead, we can use pci_save_state() to hint PCI core that the device
> should stay at D0 during suspend. By doing so, PCI core will let the
> upstream bridges also stays at D0 so the entire hierarchy is in the
> correct power state as PCI spec mandates.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v3:
>  - Use multi-line comments.
> v2:
>  - Wording change.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

