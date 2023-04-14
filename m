Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047636E1CEA
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 09:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjDNHFn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 03:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNHFm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 03:05:42 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFF430C7
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:05:42 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id pm7-20020a17090b3c4700b00246f00dace2so9883708pjb.2
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681455941; x=1684047941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TEVT8m1ij7ZYygzhNWxS+FI+xfwslOKUeZVdFaHyQQ=;
        b=aiOzIPg9UpKeRTxA0u7gjxHKHoZtjp5G5GbeoUzP+0F/42Yj6tJkIxI18zC+uS6SFQ
         fW8T/a8L0BllrNWHL2/Alkud/4nww4t0n+EK0PUOI6FwmXdDyyBUo1Hq/TfBdnZw87Rx
         RyC+VxmKlje9tKtQYFsJQiNrSj9DZFuubgGYY8NWrFq6qHLnxI4XkYyRiOiZ8ZkCgK49
         D1Nlpmr1FyyfZkE9lszqaHb+QmexQLKTsrmPAzymW9yZ8m93wCOGHK5XwfSYRLnJJhuR
         u0AC9QRaj4oxogJra0gkRvtJaHn2twHS7KEMO6C0cZErxw5XIweg9JKhr0D29038gQDa
         7Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455941; x=1684047941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TEVT8m1ij7ZYygzhNWxS+FI+xfwslOKUeZVdFaHyQQ=;
        b=Xd10N/BGhhDUdK+WsqkPG5HOjZcLPP6idYyRDkB6RKVlNvxmf3P7ABMM3XOmR+6lIa
         81j7nO5sYeqbY14ZZHNqGzg5LdY+rRL2NJ1n49wk8bVk05htROKVK08Kfr2Wp7dl4tsd
         hu0Mr6jU247MVnJmEavNzurLj68d/PkvBrS7q8zdZhwAdQHinYilncvpzkCeHbL1vaap
         K5ZAej63Mldi6mrPxGKTcyXZd8aQehFU2yuzs9DvoLn8zavhdGgB0LvwWnyq+fM97Eyz
         N/Kv7LzrpH8hv4ISrUotmGCVxCwRo5DSQUxuEXWRlTt4ST+yQlq9TGSPvqWgBn7lC5Vy
         XApA==
X-Gm-Message-State: AAQBX9fUvDr/3Xo4I8SIjlUnY+kWRAZ7jR/482QvdRn87VNY89Bi2I4l
        UL+LdYg/tnmMbJ66RO2xIAq2KXEJ0hQmIw==
X-Google-Smtp-Source: AKy350bcLGP2tAgH5HSracrFf6Nyik/Fa5B8h5YfSRI1HnFy6i1ncwfwzfjaCtpVyE37ssSVnMUzHA==
X-Received: by 2002:a17:902:f54a:b0:1a6:7534:974a with SMTP id h10-20020a170902f54a00b001a67534974amr2084378plf.48.1681455941556;
        Fri, 14 Apr 2023 00:05:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5142:7eb2:ace5:60c1])
        by smtp.gmail.com with ESMTPSA id c15-20020a63d50f000000b0051b603bf22csm1159504pgg.69.2023.04.14.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 00:05:40 -0700 (PDT)
Date:   Fri, 14 Apr 2023 00:05:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH v2 1/2] Input: xpad - Add constants for GIP interface
 numbers
Message-ID: <ZDj7QqB74Ph2AsIM@google.com>
References: <20230411031650.960322-1-vi@endrift.com>
 <20230411031650.960322-2-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411031650.960322-2-vi@endrift.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 10, 2023 at 08:16:49PM -0700, Vicki Pfau wrote:
> Wired GIP devices present multiple interfaces with the same USB identification
> other than the interface number. This adds constants for differentiating two of
> them and uses them where appropriate
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
