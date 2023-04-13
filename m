Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2946E0F5F
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 15:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjDMN55 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 09:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjDMN54 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 09:57:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CBB172D
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 06:57:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4871663EAD
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 13:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2706C433D2;
        Thu, 13 Apr 2023 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681394274;
        bh=wfHe2p1d2o9JbIbYaUmf4JPj4ak2i9hvyS+b+ODtR+4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Kn8FI12wPyEx+6UA4OLz+pmvAZud7dZEGkKxH4k4D7pMLXgqsm+1VpO6Sp7nW/WSK
         0e2m2/LheTp7o1oiZIp1lkfBVoj9mTf/zeZVNK0FifLZZkvhKz/xH72Qt1zpNwfHRZ
         xQyhfNV9jEWiTyXXfxt2+QgFf7eiUTCUOXn+Qber/E+iZbAoZUi5uh9cMfDNTVGUOW
         AnaTAG/eGK0Ydv3kbmXnr2Uq3amqrCNtTR/PQwkET5TE6x2v/GMzSZ7beOsUIlTkQ1
         2qiA3v6OWoHeKGlF5XEx7onePqqDgd5YYEjOI2+d+jG8b8lz3Y4n1qoU5DEcOxC46b
         irVfNgQzLcYcg==
Date:   Thu, 13 Apr 2023 15:57:51 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: Support for additional light sensor
In-Reply-To: <20230411161901.909940-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2304131557420.29760@cbobk.fhfr.pm>
References: <20230411161901.909940-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 11 Apr 2023, Basavaraj Natikar wrote:

> There is support for additional light sensors in the SFH firmware.
> As a result, add support for additional light sensors.
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied.

-- 
Jiri Kosina
SUSE Labs

