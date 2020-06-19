Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73C62002AA
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 09:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbgFSHWa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 03:22:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730686AbgFSHW3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 03:22:29 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13AF520707;
        Fri, 19 Jun 2020 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592551348;
        bh=nVr2Sq+RBfD6ijktwys6btoPkhmLIz2o64rIv90to5Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KZrAOl9mnIXIDYhIz2Dpxf3KD/t+D9QMJ1j+szkdID6hZYKJDyLbGoTZNjEoovcyM
         VMXnFhq8mFJmU+eX3tFoh65AuzhquDvO3O/wOnBJv3NAAFQC9yb3Dl1bYREm+E1ULM
         GoeXE3FWab2K4c2X+DOpzLjsstZ2H/ZCWo4Qol7I=
Date:   Fri, 19 Jun 2020 09:22:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
cc:     linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Siarhei Vishniakou <svv@google.com>
Subject: Re: [PATCH] HID: steam: fixes race in handling device list.
In-Reply-To: <20200616164418.14426-1-rodrigorivascosta@gmail.com>
Message-ID: <nycvar.YFH.7.76.2006190922180.13242@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2006161108150.13242@cbobk.fhfr.pm> <20200616164418.14426-1-rodrigorivascosta@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Jun 2020, Rodrigo Rivas Costa wrote:

> Using uhid and KASAN this driver crashed because it was getting
> several connection events where it only expected one. Then the
> device was added several times to the static device list and it got
> corrupted.
> 
> This patch checks if the device is already in the list before adding
> it.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

