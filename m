Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8159C6B5B3B
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 12:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjCKLg0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 06:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjCKLgZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 06:36:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C538C1A95C;
        Sat, 11 Mar 2023 03:36:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60D65B824B7;
        Sat, 11 Mar 2023 11:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084A4C433D2;
        Sat, 11 Mar 2023 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678534580;
        bh=D3r1JElUFgDIVt/JVBUG1TZDHO48CNlp5S9PVtIeIPE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=r78hw3lml7L8GaTdbHYOCwAEiYqJfLH4uVbU5QEEy8N8ZqID+a8o9Q6XMJAuzcfwZ
         qaRghKCJUd4i32ZzJLydCOyjO2HDnor3aZ/sdbYsY/ihcnUthXTdILHgYWpoLF+5M3
         CWw2XfnXEpGbeqS8XuNJPIFJ5IssdqT05PDeRPApFSFYJCsXKsZCfvHVR7B9ZjOFjv
         73TxznS6nAoT8+3yO7TcXlcuoW2fns8443UBVVrhVw8L2bjfotZm+2ZtfcO0oOkus+
         TIS9gp6BHmTHGh97k0tkP0LvTzVnzGrjkUM+eNusPTuZOIi7QoXKEL4fuyvTPgP1br
         vgjHF2zv28Epw==
Message-ID: <843bb433-e8ae-41f2-7b5f-cc5ee289dbfd@kernel.org>
Date:   Sat, 11 Mar 2023 12:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] Input: hideep - Optionally reset controller work
 mode to native HiDeep protocol
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org
References: <20230303222113.285546-1-hdegoede@redhat.com>
 <20230303222113.285546-3-hdegoede@redhat.com>
 <42ac04f2-e7dc-a5a8-750e-243aa82c35db@kernel.org>
 <857e6fc3-65f6-5b71-073f-b518ab3c814e@redhat.com>
 <ZAwIIypDOjkNLRLk@google.com>
 <4a273927-fa03-8503-e1c8-94b0223e80d1@redhat.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <4a273927-fa03-8503-e1c8-94b0223e80d1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/03/2023 12:16, Hans de Goede wrote:
> 
> "hideep,force-native-protocol" is a good suggestion I'll prepare a new
> version with that.
> 
>>> Anyways I just realized I should have not included this at all,
>>> since atm this new property is only used on X86/ACPI platforms
>>> (through platform code setting a device-property), so it is not
>>> used on devicetree platforms at all.
>>
>> Even if such properties are not documented I do not see how it will
>> prevent people from using them... I guess if they validate DT they will
>> be caught, but I am not sure that we can rely on this happening.
> 
> Right, but I have beene explicitly told multiple times (1) to not document
> device-properties when they are only used between x86 platform code and
> drivers consuming them (and thus not actually used in any DT files
> at that point in time).

Comment in the code that this is not a DT property, is the most we can
do now (so people won't use it later as argument to add to the binding)...

Best regards,
Krzysztof

