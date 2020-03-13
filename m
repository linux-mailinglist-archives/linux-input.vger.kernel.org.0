Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886A71845DB
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 12:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCMLX0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 07:23:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgCMLXZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 07:23:25 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 401E92072C;
        Fri, 13 Mar 2020 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584098605;
        bh=CQl9PB0mnvS17tqwW0xpNz6meKgIIXZTDXhO0vTqHPQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=BiQByiKLuZyW0yxQ05v6HkF+o3MUapflV8dNJPyinBW/S5/+E4OJIHhn+rVu6Fj++
         2PSdHHQW1PH9pEA+SSbNhBWMBFoF4bn3LuGrbgRD1tpLhE57pA0m21koVddbYmNI3J
         Wj7qpczfrTSkmqtEFEtXhW7vc+7RIg1iJoIWMrHE=
Date:   Fri, 13 Mar 2020 12:23:21 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Tony Fischetti <tony.fischetti@gmail.com>
cc:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
In-Reply-To: <CAOMV6SVxL=DLP6yWa+jHzu5A+PUJTJi4bk_1ZW-kXXwnaCBT5Q@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2003131222470.19500@cbobk.fhfr.pm>
References: <20200304164700.11574-1-tony.fischetti@gmail.com> <6c58685f039d329615d84e2df1cd2a155db73c61.camel@archlinux.org> <CAOMV6SVxL=DLP6yWa+jHzu5A+PUJTJi4bk_1ZW-kXXwnaCBT5Q@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Mar 2020, Tony Fischetti wrote:

> Thanks for the feedback, y'all.
> I will rename the device and add the signed-off field and resubmit.
> Thanks again

Please do it as a followup patch on top of your previous one, as I've 
already pushed that one out and we are generally not rebasing live 
branches in hid.git.

Thanks,

-- 
Jiri Kosina
SUSE Labs

