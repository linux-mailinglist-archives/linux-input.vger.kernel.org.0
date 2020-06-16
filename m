Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46321FB631
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 17:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgFPPbX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 11:31:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729609AbgFPPbW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 11:31:22 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFE1F208E4;
        Tue, 16 Jun 2020 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592321481;
        bh=9/aht6R5KQOY6JU6rOdgGhXB08aDpkjzoTl5v2b5FHk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=f5gbh68QBXZHSAfeG6MfGTjNPNfA4rmq4QgU8JE0kq+6wq6hp5QJgE8HNX9b+NzGZ
         hNUPqHeJVnfE+JCtkBScLxIhYBCZpNVbVSbsbihK63JNJd03Z8LLr9BccWxllntGkH
         tVH1uzDbMpqTBxjDJGvyC1KPg8S4sO+KQ7Ti5y7Q=
Date:   Tue, 16 Jun 2020 17:31:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Caiyuan Xie <shirleyxcy@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Caiyuan Xie <caiyuan.xie@cn.alps.com>
Subject: Re: [PATCH] support other device which report id is 2
In-Reply-To: <20200522090610.5856-1-Shirleyxcy@gmail.com>
Message-ID: <nycvar.YFH.7.76.2006161730310.13242@cbobk.fhfr.pm>
References: <20200522090610.5856-1-Shirleyxcy@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 May 2020, Caiyuan Xie wrote:

> From: Caiyuan Xie <caiyuan.xie@cn.alps.com>
> 
> <Change list>
> -support other device which report id is 2.

I've changed the patch title and changelog a little bit so that it's in 
line with the general kernel changelog style, and applied.

Please check how it looks like for the commit, and try to get closer to it 
with any future submissions.

Thanks!

-- 
Jiri Kosina
SUSE Labs

