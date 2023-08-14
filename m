Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CDD77B589
	for <lists+linux-input@lfdr.de>; Mon, 14 Aug 2023 11:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235476AbjHNJfY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Aug 2023 05:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbjHNJek (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Aug 2023 05:34:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02ECE62
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 02:34:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E2F76308B
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 09:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DEEC433C7;
        Mon, 14 Aug 2023 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692005677;
        bh=YsmZBVpIc4B7O5IpTFE3k08A2Cn0DMN/SxP6LAJOrz0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=YxPKz9cCYnqOkWZUCWrxvhkT+ngzPLVonIYQl1/UFIxlyOtjbBKRLpSNenLyFrp1Y
         0RYglBpMRsnAhePCYn1nxcPMAFhawkK3DXawexOYokKdP5jmiEiaxlYOvnyIbTnMlp
         WdAxKURGOQ9inJz0K/BFHO1DBBVQoh0/Bt/h3khUjdcAy22pFZUXH0L8+ZQBh1xvwu
         OLFacb5ypM/1TL2Jgk9/9PX2AaFo668ypqUduwmv3I08c5LsCsjBAQzB+1wOLsdlp9
         dBJ6nvVx5vlHahR92hAYreKT2jifoPCHe6Usr5jw19cYy/1o6i4fC7lj9alHPDUpB0
         3re+PzYC6jtag==
Date:   Mon, 14 Aug 2023 11:34:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        lains@riseup.net, hadess@hadess.net
Subject: Re: [PATCH v2 1/2] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
In-Reply-To: <20230716182320.85483-1-mavchatz@protonmail.com>
Message-ID: <nycvar.YFH.7.76.2308141134261.14207@cbobk.fhfr.pm>
References: <20230716182320.85483-1-mavchatz@protonmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

