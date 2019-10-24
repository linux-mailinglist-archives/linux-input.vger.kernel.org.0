Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4D5E3AA5
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 20:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406106AbfJXSIg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 14:08:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44327 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403845AbfJXSIg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 14:08:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id q15so12235469pll.11
        for <linux-input@vger.kernel.org>; Thu, 24 Oct 2019 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v+rtTkflK5mXrmgKu1040tFl9idtMCfV1Ih4oGXZyHw=;
        b=Zzoa6PFGLcKlYEozmAVy32ltv3oIX2j1Jr/oRRJVslaV+JF7S0hYZxVMJPjfbdK3GW
         b7xphZo7ooHAnl/JGwT3+y/ZbKcn+ckk7+Czejm8bqQWAYjM+FEAys59Fb+2UCekd+El
         i8b4Q25l7XBZexdIGNRXfzMY/y4q0rueoqvJk8lBGm1ZvI2nJDR7ao+0B6XzJ2+iYYha
         erKtWJiXON4A33o27UF1ZGJRzG91j1yha//XLqaTgtKE+A4/roBcKU7WvheDlKe3PuRD
         HNHHkgNEH4+9lZ59iq60vVnH0q5RcFHXxIGHEJr/FIbwda8/8Y/iGkcVLvdM6qf7ha1S
         JHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v+rtTkflK5mXrmgKu1040tFl9idtMCfV1Ih4oGXZyHw=;
        b=pF3ufS6FK0uU/fkg1L2pm8/GpP54locpUIg7rVtVbYoJiQ+OP4nb6l4yPvcfyVRMY4
         Xa28xLIQosSiAB+IUXbxMZZlj4eVrwx2RhWcj0STYYkkYhLDFNDnH0dxiNNi3MMAqO93
         aG5Nz6BGkZKPF/ud/Uc1ZCQTbUpvfuu61KBxRiHBZBPe+YZ5/f2EHEBSznaI6WVoSnuI
         TYGQb0/gPd/dC4PUWL0Uy40TmGgT/nYzsrpZw/PlEnVr0ypMuvdPbbwMMaSfy3g+UKqF
         N5tZ5VMH8EnC6yF0yVSJEwkvj6VdE/eo5MZZtUr3zAHvkzF1qk/8q5oeqVd84Lo02HlH
         2ssg==
X-Gm-Message-State: APjAAAWjts7qS6X91fJmOIGOzWFrsQPIAbDkgLWtw6vqq5RLkmPXEX+G
        1HiznIUK/fg88cQkeSanke4JM+H2
X-Google-Smtp-Source: APXvYqzibxqPBM4QC4f5CGc/3Nz3wDHbmuktYcZ4fXs9BrUakwYZAB5PzH2A2/8S27rkdvQ0ma4H1w==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr17726736plo.189.1571940515250;
        Thu, 24 Oct 2019 11:08:35 -0700 (PDT)
Received: from SD ([106.222.8.16])
        by smtp.gmail.com with ESMTPSA id b13sm11611617pgd.58.2019.10.24.11.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 11:08:34 -0700 (PDT)
Date:   Thu, 24 Oct 2019 23:38:22 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     robh@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: touchscreen: Add NULL pointer check before
 dereference
Message-ID: <20191024180822.GA6408@SD>
References: <20190901182309.GA5574@ahmlpt0706>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190901182309.GA5574@ahmlpt0706>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 01, 2019 at 11:53:09PM +0530, Saiyam Doshi wrote:
> In sx8654_probe function, if call to device_get_match_data()
> return NULL, it dereferences driver_data from 'id'.
> 
> To avoid NULL pointer dereference, add check to make sure
> 'id' is not NULL.

Any review / update on this?

-Saiyam
