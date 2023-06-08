Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84877281E0
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 15:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235521AbjFHN4Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 09:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbjFHN4Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 09:56:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41069E
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 06:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 793A661A21
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 13:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BAFC433D2;
        Thu,  8 Jun 2023 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686232582;
        bh=bmzEjbDWnF7Q4mncCnAODBCuIyTMl9yMIyoQsVNP2PI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Pg/yEuynEWC6EOqkeaRk4HcuoA26rcJREwRkE+LLxi3YxnuufHmtBG3uEZ+tAjf4o
         jHJxIAjul78BQuwJddrlodXH2+AWPQtlwg9tigoOORW8oAGEM5n/u3cYXnx0Qd0y3z
         5Fn3PXuWcAuAobKd/IG+fBXPIpRUe5OKTWGatd4HYrB+e66loks6ShE85t9JHpwn0R
         PI9GRYo2gRaokRyuaPRHkQxLx2naOHReJNNrce9/u7YMnq8LUhP0WSBP2c1I8FVUVz
         kZBxMhhycoKWlIbVkngDyqdCp6+ug3kPOnt/l/6dJE7u3bB4CxpsOsWWMsAWGDP5wy
         bG50N4x35yD/g==
Date:   Thu, 8 Jun 2023 15:56:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Joshua Dickens <joshua@joshua-dickens.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] selftests: hid: Add touch tests for Wacom devices
In-Reply-To: <20230511194754.129571-1-Joshua@Joshua-Dickens.com>
Message-ID: <nycvar.YFH.7.76.2306081556040.29760@cbobk.fhfr.pm>
References: <20230511194754.129571-1-Joshua@Joshua-Dickens.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 11 May 2023, Joshua Dickens wrote:

> Adding a wacom touch device to use the test_multitouch tests.
> Adding a 2 additional tests.
>  - A test to check if a touch event is sent when the contact_id of the event is 0.
>  - A test to check if a touch event is not sent when confidence is set to 0.
> 
> Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Applied, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

