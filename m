Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF81E1B6C8E
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 06:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgDXEZE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 00:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgDXEZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 00:25:04 -0400
Received: from vulcan.kevinlocke.name (vulcan.kevinlocke.name [IPv6:2001:19f0:5:727:1e84:17da:7c52:5ab4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583C1C09B045
        for <linux-input@vger.kernel.org>; Thu, 23 Apr 2020 21:25:04 -0700 (PDT)
Received: from kevinolos (host-69-145-60-23.bln-mt.client.bresnan.net [69.145.60.23])
        (Authenticated sender: kevin@kevinlocke.name)
        by vulcan.kevinlocke.name (Postfix) with ESMTPSA id C883A185F83E;
        Fri, 24 Apr 2020 04:25:01 +0000 (UTC)
Received: by kevinolos (Postfix, from userid 1000)
        id 160F61300671; Thu, 23 Apr 2020 22:25:00 -0600 (MDT)
Date:   Thu, 23 Apr 2020 22:25:00 -0600
From:   Kevin Locke <kevin@kevinlocke.name>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add ThinkPad S230u to i8042 nomux list
Message-ID: <20200424042500.GA107217@kevinolos.locke.internal>
Mail-Followup-To: Kevin Locke <kevin@kevinlocke.name>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <feb8a8339a67025dab3850e6377eb6f3a0e782ba.1587400635.git.kevin@kevinlocke.name>
 <20200420170234.GN166864@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420170234.GN166864@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-04-20 at 10:02 -0700, Dmitry Torokhov wrote:
> Applied, thank you.

I believe I was in error and nomux only appeared to fix the issue
because the controller continued working after warm reboots.  After
more thorough testing from both warm and cold start, I now believe the
entry should be added to i8042_dmi_reset_table rather than
i8042_dmi_nomux_table as i8042.reset=1 alone is sufficient to avoid
the issue from both states while i8042.nomux is not.

Please drop or revert the previous patch, if possible.
I will send a corrected and better-tested patch momentarily.

My apologies for the confusion,
Kevin
