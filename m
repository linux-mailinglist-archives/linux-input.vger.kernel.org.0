Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F037206DF6
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 09:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389947AbgFXHlq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 03:41:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:43014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389695AbgFXHlq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 03:41:46 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0735420768;
        Wed, 24 Jun 2020 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592984505;
        bh=qIen1QF6JcdhGQraPr/EDO0cUQiknnqSBApqouK5oqo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=a6YvD8/YOjgxfwR+EfeLoFvGLVil3NeoB5BIRHrgT1hmrQo7sL9ckepV0VVTShHdo
         elNu+Uw6nmPXLMGuqf4aiE1lfFaps1VOQgfD0mznzfJnGYT14nwws8GC58ZFVbo9sF
         kMZjQGfhvWfnVd3ZoFxPDf6pTfNNLrq2ATE9NJUg=
Date:   Wed, 24 Jun 2020 09:41:43 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     David Rheinsberg <david.rheinsberg@gmail.com>
cc:     linux-input@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update uhid and hid-wiimote entry
In-Reply-To: <20200619145759.37941-1-david.rheinsberg@gmail.com>
Message-ID: <nycvar.YFH.7.76.2006240941340.13242@cbobk.fhfr.pm>
References: <20200619145759.37941-1-david.rheinsberg@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 19 Jun 2020, David Rheinsberg wrote:

> My last name changed to "Rheinsberg", so update the maintainer entries
> and adjust the emails while at it.
> 
> Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

