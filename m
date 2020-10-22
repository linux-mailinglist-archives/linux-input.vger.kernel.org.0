Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86008295C43
	for <lists+linux-input@lfdr.de>; Thu, 22 Oct 2020 11:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896129AbgJVJwV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Oct 2020 05:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896124AbgJVJwV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Oct 2020 05:52:21 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7ED49223FB;
        Thu, 22 Oct 2020 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603360340;
        bh=hq7F69R+UMASZpr3h/iSX6e606GrcBY8I32ETImW7JY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=UutFAyyxSFAvhIijNV+AZfHprt//uY1N/mDEX2p8P6tcN5lLdvFc1ttlqhveJXSr1
         tHkuRPaB8+2rMHFKb70ZNO6rCYnvuUMAn1Ug9lKFc4ebAZd+ariPd36lOL+ETwdXrF
         laOdZqWAIVRtKrKXOJ3EC9SoQyV/GPKpN+6dwRKY=
Date:   Thu, 22 Oct 2020 11:52:17 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Martijn van de Streek <martijn@zeewinde.xyz>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: Add ID for Trust Flex Design Tablet
In-Reply-To: <20201016063805.4059-1-martijn@zeewinde.xyz>
Message-ID: <nycvar.YFH.7.76.2010221152040.18859@cbobk.fhfr.pm>
References: <20201016063805.4059-1-martijn@zeewinde.xyz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Oct 2020, Martijn van de Streek wrote:

> The Trust Flex Design Tablet has an UGTizer USB ID and requires the same
> initialization as the UGTizer GP0610 to be detected as a graphics tablet
> instead of a mouse.
> 
> Signed-off-by: Martijn van de Streek <martijn@zeewinde.xyz>

Applied, thanks Martijn.

-- 
Jiri Kosina
SUSE Labs

