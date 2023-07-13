Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEF57529ED
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 19:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjGMRiH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 13:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjGMRh4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 13:37:56 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5792702
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 10:37:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68336d06620so1009153b3a.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689269875; x=1691861875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxqnRk3YFF6uh7crh5sD9lJdvYqQgLk/3QVFdG6O4Nc=;
        b=Qoc3SrNP/4aApGha0MIH0lPx5VmVS9yamBsVLGmP8ewM37DujHUGe5DL/rIt/f8bnN
         qhrcWHPBmTJTyN+seV9U2aNefGpL/gdkOFKDZrJVvQvPda/vRMLDiqF9C2VVqh0LNcpO
         eGluv1WRKUgee9LgcP3W2oHvrrUFXwFx2MrUXGxBeXNdqhiiT7cGWLHOb2Tzi0j25MIK
         Ft+9i7fuYE7tnRdxP5rzdfk+ZqYEhWtjgxASLwMSF2+GzeutzWyFPlzU7USHnKAiFQbP
         a5FcTgJQWIwhv26K3fizoquWfOEIY96v5bMNg4QtJoX9/CnucJ0la5cidMKknFWTkjfp
         C7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689269875; x=1691861875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxqnRk3YFF6uh7crh5sD9lJdvYqQgLk/3QVFdG6O4Nc=;
        b=bgFiQws65SZgFbZM31E1k1KqB/OJgbs3U4brzRRFe6j4QuN/R6RGm1iVl1wyveVj9k
         w4potgUmMqBN5+d+0TyyQFxuQSPDVkZ3719N5iFP9bzTN1TCybeKVDzpujMu/Oobd2zg
         sptMbFDVhu0qtFPuhHkvbp4wARv6RaVj3WjvQ/GGO5qklZTG6Xah1upkw1oSUb64r54u
         Ivb7BhG/100yxdq2DzZ4a+TaOVOXzlJTdpZM+0OiUHLHyFm+8K+tlamPPLBVg+gNNTqH
         wJHIv123zi10jCsjqfcu9cDXjFYw1va9YQylQojTmNV1VfeuE/HgKGzu0iHzGhMmrMsm
         h+Rg==
X-Gm-Message-State: ABy/qLbKAOCfK7OcbcnkuAW7wIcf6W1qJTpAsw1EWgkhinqFNiqu1hb+
        kedICmYNeY2JllDuwmGZDAg=
X-Google-Smtp-Source: APBJJlECg+ztDVW4ZCf69QQ1w8+g6j8w9DMkAEUcyYDinfXMZrU/BVu2o5cqmQ5XIGmce0AUF7BScQ==
X-Received: by 2002:a05:6a00:3a26:b0:67f:1d30:9e51 with SMTP id fj38-20020a056a003a2600b0067f1d309e51mr2766875pfb.33.1689269875437;
        Thu, 13 Jul 2023 10:37:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75e2:8bbb:e3b8:95b3])
        by smtp.gmail.com with ESMTPSA id h3-20020aa786c3000000b00682af82a9desm5869769pfo.98.2023.07.13.10.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 10:37:55 -0700 (PDT)
Date:   Thu, 13 Jul 2023 10:37:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Nguyen, Max" <maxwell.nguyen@hyperx.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers
Message-ID: <ZLA2cE+ojFwCLO+2@google.com>
References: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZKxVBULWtM30ZJ7D@google.com>
 <MW4PR84MB1780BBFAD855717EB1EA86A9EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR84MB1780BBFAD855717EB1EA86A9EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Max,

On Thu, Jul 13, 2023 at 12:43:19AM +0000, Nguyen, Max wrote:
> Hi Dmitry,
> 
> I have sent over a new patch.  Let me know the whitespace-damage issue is resolved.  I will need to adjust the acks since I had missed it.
> 

It looks like you are using Outlook, and it will not work. It sends a
mix of HTML and plain text, and it mangles the plain text.

You need to look into setting up "git send-email" or mutt or something
else besides Outlook to send kernel patches.

Thanks.

-- 
Dmitry
