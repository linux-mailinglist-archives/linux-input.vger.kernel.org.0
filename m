Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B5C57BE10
	for <lists+linux-input@lfdr.de>; Wed, 20 Jul 2022 20:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiGTStK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jul 2022 14:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbiGTSi7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jul 2022 14:38:59 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE5073904
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 11:38:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id p8so5982434plq.13
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ChXnRY/x91qYaSkVdnC8O+He+BLLSe/5j0Oz9dKeGP8=;
        b=RElcgBn3bU518JEsf6WaDMB0OwXxvbxj7WimN72tbP8N97eUtrR6MeSyBI11Rjkx/C
         RDTMOm3qGLUaPT3CZGc17Ze733VPRo8d9AQLXkUHUaDL+xky3N/eS7XxXWQXYqkEp5Iq
         iX+kr35GYuQeA1h0aOohR/YHueGaLGLnKjZp7g/v8khPG5hyWwQkNYQUP4O5MeHwhiIv
         D7VqisyrT6x0cd9k39EoFOc7lvGJV5kyUz081W8ph+LnpHGDCk/pvmYluBQPfbqnNS9Y
         q1VQV52mVtotK/VB1PhGixqcyjff2t8iJCf4r2ppoWFoSjrXQr3cFL2GsN9EqmDEoFaR
         JZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ChXnRY/x91qYaSkVdnC8O+He+BLLSe/5j0Oz9dKeGP8=;
        b=T0irSdb63UtCybXpEToBtOjftlPoRxHnPgE5npWOKo7cZJuR5U50/a5e1tXptZjxs+
         FuAtWmScKS0KGlRq+c1n4VLjRdEHYPUwONbSi/NWOEOt7lzLo66OaThblqjmkPAMqkYr
         rLEqF0T87NcGacW3Z3gpkH0QF93dWTCUQ1Z80dcPQ7pMPB1Je6hgX/fqGYKZP0/3QeDr
         ZbRVPro+qEpQ/ziUaniULOahJvxCjPHYlwlIqDzkCOPlfnCfNfm0WsAn+NMjoqtZqACZ
         gbAwkNFx1AWgZG8oEjuNeXrTFaxtlvaoQhjXQEkfoIh7nC0Y8rOuq5GEs0hpd8Xxe7Yi
         DT4Q==
X-Gm-Message-State: AJIora+vl3qzL0AsSLt6nKY9DAH1bpB54q6UteBEHKWAHTo/V15Q8MLm
        JzJqT0Ge5OH2WJCh6lrUkh0=
X-Google-Smtp-Source: AGRyM1sUAAj/HIfS0u2rC5TaE/7bS+6s/ENF6ZHM47lrpMCgOUOzgX0S0F30siHo3pQLoErd82hRdg==
X-Received: by 2002:a17:90b:8d:b0:1ef:74c8:1541 with SMTP id bb13-20020a17090b008d00b001ef74c81541mr6932549pjb.103.1658342332265;
        Wed, 20 Jul 2022 11:38:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:8a:775:d4b2:21a6])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a734800b001f004ba93b1sm2016726pjs.27.2022.07.20.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:38:50 -0700 (PDT)
Date:   Wed, 20 Jul 2022 11:38:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com,
        benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        peter.hutterer@who-t.net
Subject: Re: [PATCH v2 2/2] Input: Inactivate slots in input_inhibit_device()
Message-ID: <YthLtxDq5YxiOpaH@google.com>
References: <20220718151715.1052842-1-acz@semihalf.com>
 <20220718151715.1052842-3-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718151715.1052842-3-acz@semihalf.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 18, 2022 at 03:17:15PM +0000, Angela Czubak wrote:
> Function input_dev_release_keys() issues BTN_TOUCH = 0 event to the
> userpace if there was any touch present.
> Make slot state consistent for multitouch devices and send
> ABS_MT_TRACKING_ID = -1 for every active slot when the device gets
> inhibited.
> Factor out sending EV_SYN from input_dev_release_keys() as we may possibly
> want to send it later.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>

Applied (reworded the patch description a bit), thank you.

-- 
Dmitry
