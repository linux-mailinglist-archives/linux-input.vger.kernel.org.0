Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2892B6C7518
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjCXBdy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjCXBdt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:33:49 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC732917E
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:33:31 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so3687494pjp.1
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZowZOMW0NCtdZ/qCPNlfAzAw8ZdYgXnaMwIm6i7j8Q=;
        b=LwDo1SQu0uIsi33vXceapCqqk3uxYtGoDpPu+3Q9qUU1PXUYdc+zvS3hMa4YROMMTG
         qMX37TfC1P4upm3DOIqVrth8JmBBW5QgmPHDEdVuTggT68yR/1njuVmB5tpwG3qIrhX1
         WN9t+RGnQ3Cj538f9BFqn00AielPFAR2naU8z/UgRE9PoXCUdFH/hOnVyTY4bGEAza3/
         Q7lDljSYtDffG/o9GwtxjfYf+Ec9haeNd103Yhq5GxR89P7feJoNKBW2CA4tQsb8rgOb
         5jsa/PC7w10XvH2Z5JfeE6+Yx0CGr66cXOxLd4cxOf47WaVAo4sB3pGNr988ZpSdED3B
         8YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZowZOMW0NCtdZ/qCPNlfAzAw8ZdYgXnaMwIm6i7j8Q=;
        b=sLE2jqAINLSqtYxQMNMuuzs2QcKflZd2JjCN6409iEJs76QJ92vTGZ393WZUCTwdbx
         7b8dbseLD00I2J2JLk8nC+XNVZD7AmM57FAy7wBdzXHcYptYsmRh+IzgL5pQleq5p28p
         C3Pk7DSIbDcXZJehyG73s7wcDbNr4OxrDIxzCYQKQC7JKdGP06UugvmSOgxAPMfyuT3t
         l4y75yt3Bkr6SVnI4RoaLdWDINEaAuy3UW1kOP6vwMifiKwNc2p5WBYjtNoQdgMYntt3
         GcfMGdtlo8ignR75n65QoFbqlYEuo8XKO3gusAz3C+fhstK0FiTGP+hafvIqMcT3aIAY
         0HXQ==
X-Gm-Message-State: AO0yUKXQ9PV8MDs9Q//aj+k0nYgmfk4fGxbYC5MN8GoSMS56etFHi9Ly
        6Gzec9jGZVbDfhKDHjjo5aU=
X-Google-Smtp-Source: AK7set9twqki45FjlWrNDin3gK3WEqihLv16l+p0w9l7I+WC4BEVF//l/msGJCNXrwNbx4hfli8Sjw==
X-Received: by 2002:a05:6a20:4929:b0:da:f473:4ff5 with SMTP id ft41-20020a056a20492900b000daf4734ff5mr1159905pzb.17.1679621610656;
        Thu, 23 Mar 2023 18:33:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b005a8db4e3ecesm12631190pfa.69.2023.03.23.18.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:33:29 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:33:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH 3/3] Input: xpad - Add VID for Turtle Beach controllers
Message-ID: <ZBz959+RkRNHKGjj@google.com>
References: <20230225012147.276489-1-vi@endrift.com>
 <20230225012147.276489-4-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225012147.276489-4-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 24, 2023 at 05:21:48PM -0800, Vicki Pfau wrote:
> This adds support for the Turtle Beach REACT-R and Recon Xbox controllers
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
