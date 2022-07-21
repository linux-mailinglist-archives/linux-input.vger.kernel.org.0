Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA60057C9EE
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 13:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbiGULuJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 07:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiGULuI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 07:50:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28442BC5
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 04:50:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8EEE461C21
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 11:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCE9C3411E;
        Thu, 21 Jul 2022 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658404207;
        bh=6oL34VVFDeazlj147McteD2jFavkEBHLQCKAVdnNm4M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZQJL5D9oryzhFvD7V43ohjWZtS0VtF6GLLuGQBiCBPMI+8AgT6cXkFfFVdIvyCEq1
         j1Iyfmb2Byrzb2A/UNCwKLBI0zZrz2MrEF6yc0O4gNH2TZKoRNQSOq7x8VOeMSFul/
         I71RY8OKat6QdATbI+fg1KtXceefCgNo0dcjdKOgMWVXIwZGe/p+xMh9zS5GYQeKzC
         IQqOSNYhh8lmQTg7AtaNiQ+C9Xwlu3GPsPlh61K9Q19FpVEuv1hRtNLvr92jX7omIk
         dm+VJDMNP4fooB3fY4mPjIGnPIcXX+8ic60/hXSvViJ3YyPxXKkz0bOqJef32jbniu
         CzH8OLSalJ7Jg==
Date:   Thu, 21 Jul 2022 13:50:03 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: wacom: Force pen out of prox if no events have been
 received in a while
In-Reply-To: <20220715230519.2183-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2207211349490.19850@cbobk.fhfr.pm>
References: <20220715230519.2183-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Jul 2022, Jason Gerecke wrote:

> Prox-out events may not be reliably sent by some AES firmware. This can
> cause problems for users, particularly due to arbitration logic disabling
> touch input while the pen is in prox.
> 
> This commit adds a timer which is reset every time a new prox event is
> received. When the timer expires we check to see if the pen is still in
> prox and force it out if necessary. This is patterend off of the same
> solution used by 'hid-letsketch' driver which has a similar problem.
> 
> Link: https://github.com/linuxwacom/input-wacom/issues/310
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

