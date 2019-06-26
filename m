Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440F756824
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 14:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfFZMB6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 08:01:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfFZMB5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 08:01:57 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A6B12080C;
        Wed, 26 Jun 2019 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561550517;
        bh=vheSS1kXqdxt3pqny7qpx7vt14bV6C/mIPWbVOThWds=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eg+CHsUDJvn40wihQYPF4GUf7BX1MDnCycC0zij6YDbqmj4Nt7n/Y+BTIb3POenEn
         EbwOiwtjPy/iUKmZvEwBE69Bn7V37dDXA/ySYQChW+1eW6Be7aqYm2pEAdYYOMdAyS
         7d4QsU+3g3LdbmFyGPUj87bYQwIjbWLbBBmz12ZY=
Date:   Wed, 26 Jun 2019 14:01:54 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kyle Godbey <me@kyle.ee>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: Add support for Huion HS64 tablet
In-Reply-To: <20190615231506.17443-1-me@kyle.ee>
Message-ID: <nycvar.YFH.7.76.1906261401440.27227@cbobk.fhfr.pm>
References: <20190615231506.17443-1-me@kyle.ee>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 15 Jun 2019, Kyle Godbey wrote:

> Add support for Huion HS64 drawing tablet to hid-uclogic

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

