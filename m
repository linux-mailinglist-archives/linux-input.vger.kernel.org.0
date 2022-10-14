Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736205FEBCE
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 11:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiJNJiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 05:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiJNJiL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 05:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9CB1BE1F8
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665740290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YPcsdhguVebBYw6wlhJcVtchAbBz7klXMKMCGpq3nBc=;
        b=RIFkzM1odvoGKpnsRWIuYcIEPMKJ0H5rl9bV+t+bL4glCjWf5t9f0vw/1cXVcR2PkOtPqf
        FlhisCNDat6oHepVnuFVjHcmQ0XB/yo67HLNDmlnvfvj0TIaOh6w+J9TznnabpcfrVGBdK
        7oZpsa0orEfHu0oIF2/gMtqNZgsNq/8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-dAVX3cD1MxC9HGJ55TJU1Q-1; Fri, 14 Oct 2022 05:38:09 -0400
X-MC-Unique: dAVX3cD1MxC9HGJ55TJU1Q-1
Received: by mail-il1-f199.google.com with SMTP id l5-20020a056e0212e500b002fa8ea32922so3498606iln.15
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 02:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPcsdhguVebBYw6wlhJcVtchAbBz7klXMKMCGpq3nBc=;
        b=h6Yck2vEOQubADMtwBofcBpxOAutwhXODNKvBtaEVoeyZBG2GDeLoUPfL93sUKpS9W
         3PHwkCYgOv7zaptQfqQ1I23/bE5PLOvjO7BVDaow/tG1kNF7s2tJoPsawqHZ5qWTEMhd
         34sdDroBYmK20nUgADWF4QMrFWyOsVCdnmMZ3tT+cSO1pSzuz0crTCvFTBL31ygAMmPA
         ET+bzHAR0xlEB59l08quYHE5j1CDDpfodVTIQgP06V6MmXx8/j7vMI2iKM8rThQSBm2L
         3r+YqCK51au1VZNvMoI65S2I7QjKRTuYoLz7CLpewe5TNDcFteqKUqA3NdaBzZKEmVB8
         Z4Lg==
X-Gm-Message-State: ACrzQf1pkkfuYG+1KxjCOTBkAodewdOUl1i470r7GjXuXZXybVIEHol9
        9xIr3LVCWZPWBHhg3ZgS0rlUTSECQN3jBlUUTiJTYSp3izlmOi4wnkFYUn+WGZpSORCOb8Sayq1
        FnnMWoHpq0XS+vcpgILZoUufiEvUFJXiV5xhRXOs=
X-Received: by 2002:a05:6e02:17c8:b0:2fa:3fda:3e2 with SMTP id z8-20020a056e0217c800b002fa3fda03e2mr2041709ilu.15.1665740288243;
        Fri, 14 Oct 2022 02:38:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71V3rbiiGGgxU8j0lRH9uGIW7/RMp5qOc8iSYm6/3cYslMcMTyJNXceNRsIAzGSuOcvrmgUDo4dscobzW34us=
X-Received: by 2002:a05:6e02:17c8:b0:2fa:3fda:3e2 with SMTP id
 z8-20020a056e0217c800b002fa3fda03e2mr2041703ilu.15.1665740288060; Fri, 14 Oct
 2022 02:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220915123432.520760-1-marcus.folkesson@gmail.com> <CAM8FrK+qj8aao5mEzzvmBS0Zi=qXqVXnE6X4uQP4Hp6-cPedJw@mail.gmail.com>
In-Reply-To: <CAM8FrK+qj8aao5mEzzvmBS0Zi=qXqVXnE6X4uQP4Hp6-cPedJw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Oct 2022 11:37:56 +0200
Message-ID: <CAO-hwJJ5+WFUamDJERu=EHnTq04u=bMo3TLxpCWUJbyEFPZ-gQ@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-elan: use default remove for hid device
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 14, 2022 at 10:25 AM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
>
> Den tors 15 sep. 2022 kl 14:28 skrev Marcus Folkesson <marcus.folkesson@gmail.com>:
>>
>> hid_device_remove() will call hid_hw_stop() as default .remove function
>> if no function is specified.
>>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> ---
>
>
> Ping on this patch and the other similar patches.

Hi Marcus,

Just a quick FYI, we are still in the merge window period, and as such
we can not push anything in linux-next that is not 6.1 material. Given
that I intend to take those in 6.2, I will be able to process those
patches next week at the earliest.

Cheers,
Benjamin

