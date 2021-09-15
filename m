Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E6D40C7AC
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 16:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbhIOOra (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 10:47:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhIOOra (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 10:47:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F49C60F13;
        Wed, 15 Sep 2021 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631717171;
        bh=ppQca55CGIYRdhkcEUxkj3L1sQ4SuYywuU//21qlja8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=kIiaySTlnM4aI9wzDQ12FTP9fjNHF8g0Mwxjww67l7zNcs67UrzJRKc6UjXUVUZdk
         6zpOCi5hADvCtlX5A/QG/FyW1bzfY9GhXIWGAK3kEKSDa0F5jNTDBqwtbKXsG5oR+g
         YeIYwPpDacmkiz/cn+vP3MOsmI/bJmIVA7yrAzxaLfZdP0Zs/T6GPV6gScem6xJNcb
         CTG/f3vq6uLhvY2AyYdjVJEc8PGCKi5KyWGeKo52qhr8GljdsXHImVh/jNjYJ9tJdZ
         k1DsgWW4UmfXVr/uBmcpYitoksFCKHaYMFDwSMTGs7IdWFmtJ+MsYslD4jq9gIZ2S8
         +P/QXU+RknIAA==
Date:   Wed, 15 Sep 2021 16:46:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Felipe Balbi <balbi@kernel.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] HID: core: add TransducerSerialNumber2
In-Reply-To: <20210820161655.211583-1-balbi@kernel.org>
Message-ID: <nycvar.YFH.7.76.2109151645560.15944@cbobk.fhfr.pm>
References: <20210820161655.211583-1-balbi@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 20 Aug 2021, Felipe Balbi wrote:

> From: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> A recent request for change to the HID spec got approved adding support
> for another 4-bytes to the Transducer Serial Number. This commit adds
> support for the new usage.
> 
> https://www.usb.org/sites/default/files/hutrr103-transducerserialnumbermoresignificantbits_0.pdf
> 
> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>

Applied, thanks Felipe.

-- 
Jiri Kosina
SUSE Labs

