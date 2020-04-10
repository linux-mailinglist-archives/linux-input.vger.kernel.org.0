Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7EA1A4946
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 19:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgDJRim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 13:38:42 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45480 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJRil (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 13:38:41 -0400
Received: by mail-ot1-f65.google.com with SMTP id 60so2477994otl.12;
        Fri, 10 Apr 2020 10:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+An5MImq5aeSw1a7Ke7WjRjEzcBp/O4lsgep7Vw6+lM=;
        b=VQ3+AVAVJOX4JutuR7KUpft8GWE3/6r5VVv2lPBzGnOwIujwIPMv0oiGN7Ke+5xElE
         3DVfoB4PNOKZuTjWwHNam2QUh8j7wM66TFVUQEeM+9HJ94XFNEPVaa5bnyhhflWG70jG
         27D6b5iLB3Bo49kMIY4ecJa5nUasF9weKPox0idchgcoeM/cN5trzL3ceTCdpc1SJbvG
         tee6AgFwXtNeQFvcHDLq93kd1TStRGNFErCzRPW2eFm/xWgQ7s1GtZgn8+UGuAOigCbr
         0lMF5W5vJW43IB/biIEufjmnfAxYuXyZe0qNGHDqVMSG37FJpZ47//zMENxJS/64nQG2
         KHcw==
X-Gm-Message-State: AGi0PuZjqTToUGZ7QTiozMbo3NcbLEgt3GN5hjkpH9BR7OVBOYKUpKHL
        Zaph6bz5aEDSp1ssFkICTw==
X-Google-Smtp-Source: APiQypIjp9l3nAyxjmSj439mH8Cdduvv9ZWqWXsJmNr/UkrYB46F62hCiPdO01c0cznvqiINDAqCxg==
X-Received: by 2002:a9d:7409:: with SMTP id n9mr4694976otk.173.1586540320345;
        Fri, 10 Apr 2020 10:38:40 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net. [99.203.29.27])
        by smtp.gmail.com with ESMTPSA id k132sm1567671oih.9.2020.04.10.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:38:39 -0700 (PDT)
Received: (nullmailer pid 29972 invoked by uid 1000);
        Fri, 10 Apr 2020 16:41:40 -0000
Date:   Fri, 10 Apr 2020 11:41:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com, rajatxjain@gmail.com
Subject: Re: [PATCH v4 3/5] dt-bindings: input/atkbd.txt: Add binding for
 "function-row-physmap"
Message-ID: <20200410164140.GA25924@bogus>
References: <20200328185916.98423-1-rajatja@google.com>
 <20200328185916.98423-3-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328185916.98423-3-rajatja@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 28, 2020 at 11:59:14AM -0700, Rajat Jain wrote:
> Create the documentation for the new introduced property, that
> describes the function-row keys physical positions.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v4: Same as v3
> v3: same as v2
> v2: Remove the Change-Id from the commit log
> 
>  .../devicetree/bindings/input/atkbd.txt       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/atkbd.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/atkbd.txt b/Documentation/devicetree/bindings/input/atkbd.txt
> new file mode 100644
> index 0000000000000..816653eb8e98d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/atkbd.txt
> @@ -0,0 +1,34 @@
> +Device tree bindings for AT / PS2 keyboard device
> +
> +Optional properties:
> +
> +	function-row-physmap:
> +			An ordered array of the physical codes for the function
> +			row keys. Arranged in order from left to right.

A single optional property doesn't constitute a DT binding.

> +
> +Example:
> +
> +	This is a sample ACPI _DSD node describing the property:

Neither does this ACPI stuff.

Rob
