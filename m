Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58CAA77B5CF
	for <lists+linux-input@lfdr.de>; Mon, 14 Aug 2023 11:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbjHNJzQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Aug 2023 05:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbjHNJzF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Aug 2023 05:55:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C414A3
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 02:55:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20A7264BD2
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 09:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE00C433C8;
        Mon, 14 Aug 2023 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692006903;
        bh=zMqP+561lIf29RaxwkveLE5X2XSOt1a8mqSibzRBYeM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ukBrleiiI4qUCIRwQXKfp/F4IJbxOygNawaHOeKH2hZpa2Hio+ly8U/AW886MQf6V
         qQ7+n1dMouS8szYHp4a6hfMx9f0cgp0W8XG+qoTftxyG9E7ueZsZniLuatKF3HxSEq
         HNX2P+XyFzOB1b6W30oJ6AohcNKJ5525Goru+qIcOgXOv7aOj+ZU78DriPpVj7EQF8
         uuBuAKjB0S3Us0luhqyacwMyO4+HGilsyyHsm4WNMrLpfV8tF8/wv55hL66kbEQHAn
         mhObZq3/QqNnPz8x8WWQxx2LnKgcAns+v5En/Ls5ZLMOIDvA+efRY42lfrZjsvskPQ
         nHwuo4uzCFMAw==
Date:   Mon, 14 Aug 2023 11:55:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     David Rheinsberg <david@readahead.eu>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
In-Reply-To: <20230803134001.754936-1-david@readahead.eu>
Message-ID: <nycvar.YFH.7.76.2308141154510.14207@cbobk.fhfr.pm>
References: <20230803134001.754936-1-david@readahead.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 3 Aug 2023, David Rheinsberg wrote:

> Update my email-address in MAINTAINERS to <david@readahead.eu>. Also add
> .mailmap entries to map my old surname and email-addresses.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

