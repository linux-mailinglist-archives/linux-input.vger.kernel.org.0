Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A6F32C5FA
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 02:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbhCDA1J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 19:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbhCDAAu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Mar 2021 19:00:50 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05654C061761;
        Wed,  3 Mar 2021 15:14:39 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id h10so14706929otm.1;
        Wed, 03 Mar 2021 15:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ENmhzzInLRPJWkMxwgyK0/yDT18Byk5Yvo+65Z6jlTs=;
        b=S4aC0dg/eTGcI6AUL28dPnoeH9ZnIkIHVwkQGlec8ylYNqB06wBMHaJdlN+fdEUEO6
         1ls21MJ2VKyzxLFYy5ShxIvjyUVcTTaLGRDDqudp+aca4dLAC09sMSSbWGh1TOnxBKMm
         s1Tj7ICSPkB78c8+glrXfz3LRAmzgZAOeQOage3XSigvL77XTCaATyTDvTwkzKQ7DE/2
         nVCgEvSwsgl/buGOJHIMlrDqrcdaEbQB6qVANc0G7bZjBej+DthM1boCf9oHxbgb6bvs
         HbJaBMLvPa8g0AviYYwp1mkHNBwodRDNFeJpcN5JRhx4jHOZJXcdiAuJPFh+UhHkTalZ
         EWcw==
X-Gm-Message-State: AOAM530Z8H2ul1hwBR4uQw5Od9d+QJF/GFBv7vJBL37Ki35LOb9skHgn
        obSgLpze8DtZ3WLGfWirnA==
X-Google-Smtp-Source: ABdhPJyAtpnwlr08NDcw77SwcjkZcmxVRVASO6Ef5N+X62qSlHB65BqgzAomgRWarlaYBbQ9JlwXzA==
X-Received: by 2002:a05:6830:80b:: with SMTP id r11mr1171845ots.329.1614813278255;
        Wed, 03 Mar 2021 15:14:38 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e72sm5415766ote.26.2021.03.03.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 15:14:37 -0800 (PST)
Received: (nullmailer pid 846310 invoked by uid 1000);
        Wed, 03 Mar 2021 23:14:36 -0000
From:   Rob Herring <robh@kernel.org>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     luca_hsu@ilitek.com, linux-input@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com
In-Reply-To: <20210302085130.2558297-1-joe_hung@ilitek.com>
References: <20210302085130.2558297-1-joe_hung@ilitek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
Date:   Wed, 03 Mar 2021 17:14:36 -0600
Message-Id: <1614813276.356288.846309.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 02 Mar 2021 16:51:29 +0800, Joe Hung wrote:
> Add binding documentation for ILITEK touch devices.
> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
> Changes in v4:
>   - Change IRQ flag to level interrupt
>   - Add support for common touchscreen-related properties
>   - Modify reset gpio to active low
>   - Modify irq type to LEVEL_LOW
>   - Add compatible for Lego series ICs
> 
> Changes in v3:
>   - Add include header in examples, and pass the dt binding check
> 
> Changes in v2:
>   - Convert to DT schema format
>   - Using interrupts instead of irq-gpios
> 
>  .../input/touchscreen/ilitek_ts_i2c.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml:60:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 53, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 60, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml:  while scanning a block scalar
  in "<unicode string>", line 53, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 60, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1446274

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

