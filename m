Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBFE5E7A42
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 14:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbiIWMK1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 08:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbiIWMIT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 08:08:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2425212F769
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 05:05:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3D8B611F0
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 12:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41494C433D6;
        Fri, 23 Sep 2022 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663934745;
        bh=U/lpniZ8clfdfAsvUln/ZzMuCp+JrjLqZJMmu6DVAnA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KV/1V7RV06qsPdThZnGD1Ij4ZbzKxaYypWdxrnwR0W1Hoq2EChlhntu/jBSaE214t
         HTVB9j6LEBh4jvgNOubH+99W30dgP6O5IgPDa0/i3oAIROObbV9phqZF7buxZU+TfB
         50tVLkDdd1nxUtXl8sVg/uasE5L9AcyCcFbDzVFTnbXBuSsBjitIBNHcBkGIjdQJK/
         gInd6R3/9tGo3MYMVkdhkbl/A1t+BkBsAvZDQ/+RVQyvUfioZ2jfGzfOZhFz/WcsQt
         RbCVJhj4HCtEQvBT6gZWQ6NZzUmCe0go9v/5nWmPPcus8xn9U5YjncH8IH/P12NtJ2
         K04M0D9hPWTPw==
Date:   Fri, 23 Sep 2022 14:05:41 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: amd_sfh: Handle condition of "no sensors" for
 SFH1.1
In-Reply-To: <20220923061909.636337-3-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2209231404520.16823@cbobk.fhfr.pm>
References: <20220923061909.636337-1-Basavaraj.Natikar@amd.com> <20220923061909.636337-3-Basavaraj.Natikar@amd.com>
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

On Fri, 23 Sep 2022, Basavaraj Natikar wrote:

> Add a check for num_hid_devices to handle special case in the situation
> of "no sensors" for SFH1.1.

Could you please provide a little bit more verbose changelog here? Namely, 
what problem does it cause when we don't return ENODEV in 
!cl_data->num_hid_devices case (and thus why this patch is needed in the 
first place).

Thanks.

-- 
Jiri Kosina
SUSE Labs

